import gleam/option.{type Option}

pub type Document

pub type Element

@external(javascript, "../jsdom_ffi.mjs", "parse")
pub fn parse(html: String) -> Result(Document, String)

@external(javascript, "../jsdom_ffi.mjs", "query_selector")
pub fn query_selector(document: Document, selector: String) -> Option(Element)

@external(javascript, "../jsdom_ffi.mjs", "query_selector_all")
pub fn query_selector_all(document: Document, selector: String) -> List(Element)

@external(javascript, "../jsdom_ffi.mjs", "inner_html")
pub fn inner_html(element: Element) -> String
