import gleam/fetch
import gleam/http/request
import gleam/io
import gleam/javascript/promise
import gleam/list
import subdued

pub fn main() {
  let assert Ok(req) = request.to("https://example.com")

  // Send the HTTP request to the server
  use resp <- promise.try_await(fetch.send(req))
  use resp <- promise.try_await(fetch.read_text_body(resp))

  // resp.body |> io.println

  let assert Ok(jsdom) = resp.body |> subdued.new

  let document =
    jsdom
    |> subdued.get_window
    |> subdued.get_document

  let el = document |> subdued.query_selector_all("p")

  list.each(el, fn(p) { p |> subdued.inner_html |> io.println })

  promise.resolve(Ok(Nil))
}
