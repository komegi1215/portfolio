import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {

  static targets = ["profileText"];

  connect() {
    console.log("hello")
  }

  showMore() {
    const linkUrl = this.data.get("linkUrl");
    const linkText = this.data.get("linkText");

    this.profileTextTarget.innerHTML = `<p class='description' data-action='mouseout->profile#showLess'>フリーランスのウェブディベロッパー、データエンジニア。<a href="${linkUrl}" class="link">${linkText}</a>の６ヶ月のブートキャンプをフルタイムで仕事をしなが卒業。現在は製薬メーカーでCRMスペシャリストとしてビジネスオペレーションの改善を実施。データマネジメントやデータエンジニアの領域にも挑戦中。</p>`;
  }

  showLess() {
    const linkUrl = this.data.get("linkUrl");
    const linkText = this.data.get("linkText");

    this.profileTextTarget.innerHTML = `<p class="description" data-action="mouseover->profile#showMore">I am a freelance web developer and data engineer with a strong passion for coding. I successfully completed the rigorous <a href="${linkUrl}" class="link">${linkText}</a>, a six-month program that honed my coding skills while balancing full-time work commitments.<br>
    Currently, I am employed as a CRM specialist at a pharmaceutical company, where I excel in managing sales operations. Additionally, I have begun delving into the realms of data management and engineering. No code, no life! 💻</p>`;
  }
}
