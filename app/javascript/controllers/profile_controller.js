import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {

  static targets = ["profileText"];

  connect() {
    console.log("hello")
  }

  showMore() {
    this.profileTextTarget.innerHTML = `<p class='description' data-action='mouseout->profile#showLess'>フリーランスのウェブディベロッパー。<a href="https://www.lewagon.com/", class = "link", style = "text-decoration:none;">Le Wagon</a>の６ヶ月のウェブ開発のブートキャンプをフルタイムで仕事をしながら卒業。Le WagonでTAをしつつ、フリーランスのディベロッパーとしてスキルを磨く。現在は製薬メーカーでCRMスペシャリストとしてビジネスオペレーションの改善に注力しながら、データマネジメントやデータエンジニアの領域にも挑戦中。</p>`;
  }

  showLess() {
    this.profileTextTarget.innerHTML = `<p class="description" data-action="mouseover->profile#showMore">I am a freelance web developer and data engineer with a strong passion for coding. I successfully completed the rigorous <a href="https://www.lewagon.com/", class = "link", style = "text-decoration:none;">Le Wagon Bootcamp</a>, a six-month program that honed my coding skills while balancing full-time work commitments.<br>
    Currently, I am employed as a CRM specialist at a pharmaceutical company, where I excel in managing sales operations. Additionally, I have begun delving into the realms of data management and engineering. No code, no life! 💻</p>`;
  }
}
