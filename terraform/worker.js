export default {
  async fetch(request) {
    return fetch(
      "https://raw.githubusercontent.com/stathisrava/devops-site/main/index.html"
    );
  }
}