import gleam/fetch
import gleam/http/request
import gleam/io
import gleam/javascript/promise
import gleam/list
import subdued/document

pub fn main() {
  let assert Ok(req) = request.to("https://example.com")

  // Send the HTTP request to the server
  use resp <- promise.try_await(fetch.send(req))
  use resp <- promise.try_await(fetch.read_text_body(resp))

  // resp.body |> io.println

  let assert Ok(document) = resp.body |> document.parse

  let el = document |> document.query_selector_all("p")

  list.each(el, fn(p) { p |> document.inner_html |> io.println })

  promise.resolve(Ok(Nil))
}
