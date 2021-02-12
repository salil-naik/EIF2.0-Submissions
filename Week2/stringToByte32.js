(async () => {
  try {
    console.log("Running script...");

    // string to convert
    const text = "blockchain developer";

    // using Bytes32String API
    const bytes32 = ethers.utils.formatBytes32String(text);

    // logging bytes32
    console.log(bytes32);
    console.log("Successfull");
  } catch (e) {
    console.log(e.message);
  }
})();
