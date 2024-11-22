import gleam/fetch
import gleam/http/request
import gleam/io
import gleam/javascript/promise
import gleam/option.{type Option}

// import gleam/http/response

pub type JSDOM

pub type Window

pub type Document

pub type Element

@external(javascript, "./jsdom_ffi.mjs", "new_jsdom")
pub fn new(html: String) -> Result(JSDOM, String)

@external(javascript, "./jsdom_ffi.mjs", "get_window")
pub fn get_window(jsdom: JSDOM) -> Window

@external(javascript, "./jsdom_ffi.mjs", "get_document")
pub fn get_document(window: Window) -> Document

@external(javascript, "./jsdom_ffi.mjs", "query_selector")
pub fn query_selector(document: Document, selector: String) -> Option(Element)

pub fn main() {
  let assert Ok(req) = request.to("https://example.com")

  // Send the HTTP request to the server
  use resp <- promise.try_await(fetch.send(req))
  use resp <- promise.try_await(fetch.read_text_body(resp))

  // resp.body |> io.println

  let assert Ok(jsdom) = resp.body |> new

  let document = jsdom |> get_window |> get_document

  let el = document |> query_selector("p")

  io.debug(el)

  promise.resolve(Ok(Nil))
}
