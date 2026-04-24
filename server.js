const tracer = require("dd-trace").init({
  hostname: "dd-agent",
});

async function run() {
  function myLogger(message) {
    // set SERVER_VERSION to the current git commit hash
    console.log(
      `${new Date().toISOString()} - henriktestserver version ${process.env.GIT_COMMIT} - ${message}`,
    );
  }

  function f1() {
    myLogger("f1 called");
  }

  function f2() {
    myLogger("f2 called");
  }

  function f3() {
    x = y; // this will throw an error since y is not defined, to test error logging in datadog
    myLogger("f3 called");
  }

  const myFunctions = [f1, f2, f3];

  while (true) {
    // Pick a random function from the array and call it
    const randomIndex = Math.floor(Math.random() * myFunctions.length);

    try {
      myFunctions[randomIndex]();
    } catch (error) {
      myLogger(`Error occurred: ${error.stack}`);
    }

    //wait a random amount of time of a few seconds before calling the next function
    const randomDelay = Math.floor(Math.random() * 3000) + 100;
    await new Promise((resolve) => setTimeout(resolve, randomDelay));
  }
}

run();
