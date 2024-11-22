// @deno-types=@types/jsdom
import { JSDOM } from "jsdom";
import { None, Some } from "../gleam_stdlib/gleam/option.mjs";
import { Error, Ok, List } from "./gleam.mjs";

/** @import { Option } from "../gleam_stdlib/gleam/option.mjs" */

function makeOption(value) {
  if (value === null || value === undefined) {
    return new None();
  }

  return new Some(value);
}

/**
 * @param {string} html
 * @returns {Result<Document,String>}
 */
export function parse(html) {
  try {
    return new Ok(new JSDOM(html).window.document);
  } catch (error) {
    return new Error(error.message);
  }
}

/**
 * @param {Document} document
 * @param {string} selector
 * @returns {Option<Element>}
 */
export function query_selector(document, selector) {
  return makeOption(document.querySelector(selector));
}

/**
 * @param {Document} document
 * @param {string} selector
 * @returns {List<Element>}
 */
export function query_selector_all(document, selector) {
  return List.fromArray(Array.from(document.querySelectorAll(selector)));
}

/**
 * @param {Element} element
 */
export function inner_html(element) {
  return element.innerHTML;
}
