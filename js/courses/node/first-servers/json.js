const http = require("http");

const host = "localhost";
const port = process.env.PORT;

const requestListener = function (req, res) {
  res.setHeader("Content-Type", "application/json");
  res.writeHead(200);
  res.end(`{"message": "This is a JSON response"}`);
};

let url = `http://${host}:${port}`;
const server = http.createServer(requestListener);
server.listen(port, host, () => {
  console.log(`Server is running on ${url}`);
});

// ex.
// PORT=8080 node json.js &
// curl http://localhost:8080
// {"message": "This is a JSON response"}
