/**
 * HTTP server that will print all requests to console.
 * Useful when debugging outgoing requests
 */

const http = require("http");
const { networkInterfaces } = require("os");

let requestCount = 0;
const PORT = parseInt(process.argv[2], 10) || 1337;

function getIps() {
  let allNets = networkInterfaces();
  let nets = Object.keys(allNets).filter((net) => net.startsWith("en"));
  return nets.flatMap((net) => {
    return allNets[net]
      .filter((n) => n.family === "IPv4")
      .flatMap((net) => net.address);
  });
}

function getBody(req) {
  let string = "";

  return new Promise((resolve) => {
    req.on("data", (chunk) => {
      if (chunk.toString) {
        string += chunk.toString();
      }
    });
    req.on("end", () => {
      resolve(string);
    });
  });
}

async function buildString(req, count) {
  let headers = Object.keys(req.headers).map((header) => {
    return `${header}: ${req.headers[header]}`;
  });

  let body = await getBody(req);

  let string = `
🌎 Request #${count}
Time:   ${new Date()}
Method: ${req.method}
URL:    ${req.url}

Headers:
${headers.join("\n")}

Body:
${body || "[empty]"}

---`;

  return string;
}

const server = http.createServer(async (req, res) => {
  requestCount++;
  let requestString = await buildString(req, requestCount);
  console.log(requestString);

  // Close
  res.writeHead(200);
  res.end("\n");
});

server.listen(PORT, "0.0.0.0", () => {
  console.log("\nListening on:");
  getIps().forEach((addr) => {
    console.log(`http://${addr}:${PORT}`);
  });
  console.log("========================");
});
