export default class ListView {
  constructor($table) {
    this.document = $table.ownerDocument;
    this.$headers = $table.querySelector('thead tr');
    this.$columns = $table.querySelector('tbody tr');
  }

  update(list) {
    // Build / diff the header row.
    {
      // Add
      while (list.headers.length > this.$headers.children.length) {
        this.$headers.appendChild(this.document.createElement("th"));
      }
      // Update
      for (var i = 0; i < list.headers.length; i++) {
        this.$headers.children[i].textContent = list.headers[i];
      }
      // Delete
      while (list.headers.length < this.$headers.children.length) {
        this.$headers.lastElementChild.remove();
      }
    }

    // Build / diff the columns row.
    {
      // Add
      while (list.columns.length > this.$columns.children.length) {
        this.$columns.appendChild(this.document.createElement("td"));
      }
      // Update
      for (var i = 0; i < list.columns.length; i++) {
        this.$columns.children[i].innerHTML = list.columns[i].join("<br>");
      }
      // Delete
      while (list.columns.length < this.$columns.children.length) {
        this.$columns.lastElementChild.remove();
      }
    }
  }
}
