require("@nomicfoundation/hardhat-toolbox");
require("HardhatUserConfig");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    // BASE Deployment
    baseSepolia: {
      url: "https://sepolia.base.org",
      accounts: [process.env.BASE_PRIVATE_KEY],
      gasPrice: 1000000000,
    },
    // Mantle Deployment
    mantleTestnet: {
      url: process.env.MANTLE_TESTNET_RPC_URL,
      accounts: [process.env.MANTLE_PRIVATE_KEY],
    },
  }
};

