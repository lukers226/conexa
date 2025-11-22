const http = require("http");

function testRoute(path) {
  const options = {
    hostname: "localhost",
    port: 5000,
    path: path,
    method: "GET"
  };

  const req = http.request(options, (res) => {
    console.log(`\nTESTING: ${path}`);
    console.log(`STATUS: ${res.statusCode}`);

    let data = "";
    res.on("data", chunk => data += chunk);
    res.on("end", () => {
      console.log("RESPONSE:", data);
    });
  });

  req.on("error", (err) => {
    console.error(`ERROR testing ${path}:`, err);
  });

  req.end();
}

// Run multiple tests
testRoute("/api/community/all");
testRoute("/api/community/all");
testRoute("/api/community/tech_fans");
testRoute("/api/community/test");
