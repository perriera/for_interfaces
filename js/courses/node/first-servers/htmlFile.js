const http = require("http");
const { exec } = require("child_process");
const fs = require("fs").promises;
const host = "localhost";
const port = process.env.PORT;

const requestListener = function (req, res) {
  fs.readFile(__dirname + "/index.html")
    .then((contents) => {
      res.setHeader("Content-Type", "text/html");
      res.writeHead(200);
      res.end(contents);
    })
    .catch((err) => {
      res.writeHead(500);
      res.end(err);
      return;
    });
};

let url = `http://${host}:${port}`;
const server = http.createServer(requestListener);
server.listen(port, host, () => {
  console.log(`Server is running on ${url}`);
});

// ex.
// PORT=8080 node htmlFile.js &
// curl http://localhost:8080
// (see index.html)
