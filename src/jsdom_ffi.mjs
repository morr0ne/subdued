// @deno-types=@types/jsdom
import { JSDOM } from "jsdom";
import { Ok, Error } from "./gleam.mjs";

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
