class TableView extends HTMLElement {
  static get observedAttributes() {
    return ["list"];
  }

  constructor() {
    super();
    this.attachShadow({ mode: "open" });
  }

  attributeChangedCallback(name, _oldValue, newValue) {
    // It looks like these attributes can only be strings.
    // I wonder what I should do here.
    console.log(name, JSON.stringify(newValue));

    const list = this.getAttribute("list");

    this.shadowRoot.innerHTML = `
      <table>
        <thead>
          <tr>${list.headers.map(h => `<th>${h}</th>`)}</tr>
        </thead>
        <tbody>
          <tr></tr>
        </tbody>
      </table>
    `;
  }
}

customElements.define("table-view", TableView);
