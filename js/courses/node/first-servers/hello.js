const http = require("http");
const host = "localhost";
const port = process.env.PORT;

const requestListener = function (req, res) {
  res.writeHead(200);
  res.end("My first server!");
};

let url = `http://${host}:${port}`;
const server = http.createServer(requestListener);
server.listen(port, host, () => {
  console.log(`Server is running on ${url}`);
});

// ex.
// PORT=8080 node hello.js &
// curl http://localhost:8080
// My first server!
