export default {
  async fetch(request) {
    const response = await fetch(
      "https://raw.githubusercontent.com/stathisrava/devops-site/main/index.html"
    );
    const html = await response.text();
    
    return new Response(html, {
      headers: { "content-type": "text/html;charset=UTF-8" },
    });
  }
}