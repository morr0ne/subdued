// @deno-types=@types/jsdom
import { JSDOM } from "jsdom";
import { None, Some } from "../gleam_stdlib/gleam/option.mjs";
import { Error, Ok } from "./gleam.mjs";

/** @import { DOMWindow } from "jsdom" */

/**
 * @param {string} html
 * @returns {Result<JSDOM,String>}
 */
export function new_jsdom(html) {
  try {
    return new Ok(new JSDOM(html));
  } catch (error) {
    return new Error(error.message);
  }
}

/**
 * @param {JSDOM} jsdom
 */
export function get_window(jsdom) {
  return jsdom.window;
}

/**
 * @param {DOMWindow} window
 */
export function get_document(window) {
  return window.document;
}

/**
 * @param {Document} document
 * @param {string} selector
 */
export function query_selector(document, selector) {
  return makeOption(document.querySelector(selector));
}

function makeOption(value) {
  if (value === null || value === undefined) {
    return new None();
  }

  return new Some(value);
}
