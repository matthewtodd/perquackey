import Dictionary from "./dictionary.js";
import dictionary from "./dictionary.prebuilt.js";
import List from "./list.js";
import ListView from "./list_view.js";

const $input = document.querySelector("input[name=q]");
const listView = new ListView(document.querySelector("#words table"));

window.addEventListener("load", (e) => {
  const search = new URLSearchParams(e.target.location.search);
  const letters = search.get("q") || '';

  $input.value = letters;

  $input.dispatchEvent(
    new CustomEvent("letters", {
      detail: { letters: letters }
    })
  );
});

$input.addEventListener("keyup", (e) => {
  $input.dispatchEvent(
    new CustomEvent("letters", {
      detail: { letters: e.target.value }
    })
  );
});

$input.addEventListener("letters", (e) => {
  const letters = e.detail.letters.toLowerCase().split('').sort().join('');

  console.time("lookup");
  const words = Dictionary.lookup(dictionary, letters);
  console.timeEnd("lookup");

  console.time("render list");
  listView.update(new List(words));
  console.timeEnd("render list");

  const search = (letters.length > 0) ? `?q=${letters}` : '';
  history.replaceState(null, '', `${document.location.pathname}${search}`);
});
