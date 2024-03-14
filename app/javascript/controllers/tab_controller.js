import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tab"
export default class extends Controller {
  connect() {
    this.update();
  }

  update() {
    document.addEventListener("turbolinks:load", () => {
      const tabs = document.getElementsByClassName("nav-link");
      const tabContents = document.getElementsByClassName("tab_contents_item");

      // console.log(tabs);
      // console.log(tab_contents);

      for (let i = 0; i < tabs.length; i++) {
        tabs[i].addEventListener("click", function (e) {
          e.preventDefault();

          for (let j = 0; j < tabs.length; j++) {
            tabs[j].classList.remove("active");
          }
          for (let j = 0; j < tabContents.length; j++) {
            tabContents[j].classList.remove("active");
          }
          tabs[i].classList.add("active");
          tabContents[i].classList.add("active");
        });
      }
    });
  }
}
