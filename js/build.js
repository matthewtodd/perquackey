import { writeFileSync } from "node:fs";

import Dictionary from "./dictionary.js";
import words from "./words.js";

// Run `node js/build.js` from the project root.
writeFileSync("./js/dictionary.prebuilt.js", "export default " + JSON.stringify(Dictionary.build(words)) + ";");
