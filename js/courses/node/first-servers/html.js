const http = require("http");

const host = "localhost";
const port = process.env.PORT;

const requestListener = function (req, res) {
  res.setHeader("Content-Type", "text/html");
  res.writeHead(200);
  res.end(`<html><body><h1>This is HTML</h1></body></html>`);
};

let url = `http://${host}:${port}`;
const server = http.createServer(requestListener);
server.listen(port, host, () => {
  console.log(`Server is running on ${url}`);
});

// ex.
// PORT=8080 node html.js &
// curl http://localhost:8080
// <html><body><h1>This is HTML</h1></body></html>
