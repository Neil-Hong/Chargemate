## Prerequisites

1. You need to have Coinbase Wallet extension, download [here](https://chromewebstore.google.com/detail/coinbase-wallet-extension/hnfanknocfeofbddgcijnmhnfnkdnaad?hl=en).

2. You also need sufficient fund before deploying. You can fund your wallet with Base Sepolia ETH using one of the faucets listed on the Base [Network Faucets](https://docs.base.org/docs/tools/network-faucets/) page.

## Installation

You have [Node.js](https://nodejs.org/en/) running on your computer, as well as [`yarn`](https://classic.yarnpkg.com/lang/en/).

1. Install the necessary packages.

    ```sh
    npm install
    ```

2. Duplicate `.env.example` as `.env`.

    ```sh
    cp .env.example .env
    ```

    Then configure "WALLET_KEY", it should be your wallet private key. It is critical that you do NOT commit this to a public repo.

3. Compile the smart contract through hardhat, here we have a simple NFT smart contract (ERC-721) written in the Solidity programming language as example.

    ```sh
    npx hardhat compile
    ```

4. Deploy the smart contract on base sepolia testnet.

    ```sh
    npx hardhat run scripts/deploy.ts --network base-sepolia
    ```

    Please confirm you have enough testnet ETH in your wallet before you deploy.
    After you deployed, you will get the deployed smart contract adderss on base-sepolia testnet.
