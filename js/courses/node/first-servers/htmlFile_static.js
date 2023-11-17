const http = require("http");
const { exec } = require("child_process");
const fs = require("fs").promises;
const host = "localhost";
const port = process.env.PORT;

let indexFile;

const requestListener = function (req, res) {
  res.setHeader("Content-Type", "text/html");
  res.writeHead(200);
  res.end(indexFile);
};

let url = `http://${host}:${port}`;
const server = http.createServer(requestListener);

fs.readFile(__dirname + "/index.html")
  .then((contents) => {
    indexFile = contents;
    server.listen(port, host, () => {
      console.log(`Server is running on ${url}`);
    });
  })
  .catch((err) => {
    console.error(`Could not read index.html file: ${err}`);
    process.exit(1);
  });

// ex.
// PORT=8080 node htmlFile_static.js &
// curl http://localhost:8080
// (see index.html)
