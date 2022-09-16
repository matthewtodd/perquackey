export default class TableView {
  constructor($table) {
    this.document = $table.ownerDocument;
    this.$table = $table;
  }

  update(table) {
    console.time("render -> fragment");
    const fragment = this.document.createDocumentFragment();
    fragment.appendChild(this.$table.cloneNode(true));

    const $headers = fragment.querySelector("thead tr");
    const $rows = fragment.querySelector("tbody");

    // Build / diff the header row.
    {
      // Add
      while (table.headers.length > $headers.children.length) {
        $headers.appendChild(this.document.createElement("th"));
      }
      // Update
      for (var i = 0; i < table.headers.length; i++) {
        $headers.children[i].textContent = table.headers[i];
      }
      // Delete
      while (table.headers.length < $headers.children.length) {
        $headers.lastElementChild.remove();
      }
    }

    // Build / diff the body rows.
    {
      // Add
      while (table.rows.length > $rows.children.length) {
        $rows.appendChild(this.document.createElement("tr"));
      }
      // Update
      for (var i = 0; i < table.rows.length; i++) {
        // Add
        while (table.rows[i].length > $rows.children[i].children.length) {
          $rows.children[i].appendChild(this.document.createElement("td"));
        }
        // Update
        for (var j = 0; j < table.rows[i].length; j++) {
          $rows.children[i].children[j].textContent = table.rows[i][j];
        }
        // Delete
        while (table.rows[i].length < $rows.children[i].children.length) {
          $rows.children[i].lastElementChild.remove();
        }
      }
      // Delete
      while (table.rows.length < $rows.children.length) {
        $rows.lastElementChild.remove();
      }
    }
    console.timeEnd("render -> fragment");

    console.time("render -> replace");
    const $newTable = fragment.querySelector("table");
    this.$table.replaceWith(fragment);
    this.$table = $newTable;
    console.timeEnd("render -> replace");
  }
}
