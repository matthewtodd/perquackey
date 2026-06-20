import Dictionary from "./dictionary.js";
import List from "./list.js";
import ListView from "./list_view.js";
import words from "./words.js";

const dictionary = new Dictionary(words);
const $input = document.querySelector("input[name=q]");
const listView = new ListView(document.querySelector("#words table"));

window.addEventListener("load", (e) => {
  const search = new URLSearchParams(e.target.location.search);
  const letters = search.get("q") || '';

  $input.value = letters;

  e.target.dispatchEvent(
    new CustomEvent("letters", {
      bubbles: true,
      detail: { letters: letters }
    })
  );
});

$input.addEventListener("keyup", (e) => {
  e.target.dispatchEvent(
    new CustomEvent("letters", {
      bubbles: true,
      detail: { letters: e.target.value }
    })
  );
});

document.addEventListener("letters", (e) => {
  const letters = e.detail.letters.toLowerCase().split('').sort().join('');

  console.time("lookup");
  const words = dictionary.lookup(letters);
  console.timeEnd("lookup");

  console.time("render list");
  listView.update(new List(words));
  console.timeEnd("render list");

  const search = (letters.length > 0) ? `?q=${letters}` : '';
  history.replaceState(null, '', `${document.location.pathname}${search}`);
});
