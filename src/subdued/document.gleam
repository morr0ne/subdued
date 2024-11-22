import gleam/option.{type Option}

// import gleam/http/response

pub type JSDOM

pub type Window

pub type Document

pub type Element

@external(javascript, "../jsdom_ffi.mjs", "new_jsdom")
pub fn new(html: String) -> Result(JSDOM, String)

@external(javascript, "../jsdom_ffi.mjs", "get_window")
pub fn get_window(jsdom: JSDOM) -> Window

@external(javascript, "../jsdom_ffi.mjs", "get_document")
pub fn get_document(window: Window) -> Document

@external(javascript, "../jsdom_ffi.mjs", "query_selector")
pub fn query_selector(document: Document, selector: String) -> Option(Element)

@external(javascript, "../jsdom_ffi.mjs", "query_selector_all")
pub fn query_selector_all(document: Document, selector: String) -> List(Element)

@external(javascript, "../jsdom_ffi.mjs", "inner_html")
pub fn inner_html(element: Element) -> String
