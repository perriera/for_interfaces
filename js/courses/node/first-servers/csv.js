const http = require("http");

const host = "localhost";
const port = process.env.PORT;

const requestListener = function (req, res) {
  res.setHeader("Content-Type", "text/csv");
  res.setHeader("Content-Disposition", "attachment;filename=oceanpals.csv");
  res.writeHead(200);
  res.end(`id,name,email\n1,Sammy Shark,shark@ocean.com`);
};

let url = `http://${host}:${port}`;
const server = http.createServer(requestListener);
server.listen(port, host, () => {
  console.log(`Server is running on ${url}`);
});

// ex.
// PORT=8080 node csv.js &
// curl http://localhost:8080
// id,name,email
// 1,Sammy Shark,shark@ocean.com
