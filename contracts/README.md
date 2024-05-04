# Preparation

To mint the CMN (Chargemate Token), you need to use [Remix](https://remix.ethereum.org/) to deploy the smart contract.<br/>
And you also need to have the wallet, download [here](https://metamask.io/download/) .

# Token

This is the "Chargemate Token" smart contract wrote in solidity.

Firstly, deploy the contract through your wallet address.

As shown below, you have to choose the environment as **"Injected Provider - Metamask"**. Then click **"Deploy"**.
![image](https://github.com/Neil-Hong/Chargemate/blob/main/public/deploy.png)

After deployed contract, we can get the **CMN token address** - **0xb01e6cDa798A5Ff52fc865b39055f3FD913025D9**.

---

Then expand the deployed token contract, mint the token to your wallet address, amount fill as 10000 as example
![image](https://github.com/Neil-Hong/Chargemate/blob/main/public/mint.png)

After that, call the **balance of** function to verify the amount, it should return the result as shown below
![image](https://github.com/Neil-Hong/Chargemate/blob/main/public/balance.png)

Once verified you received the correct amount of tokens, open the metamask wallet, scroll down, click **+import token** to import the token. Then you will see the 100 CMN token showed on your account.

![image](https://github.com/Neil-Hong/Chargemate/blob/main/public/import.png)
![image](https://github.com/Neil-Hong/Chargemate/blob/main/public/import2.png)

---

# Tokenshop

This is the "Chargemate Token" tokenshop smart contract wrote it in solidity, it has following functions:

1. `tokenAmount` function: This function takes an amount of Ether (`amountETH`) as input, then uses a Chainlink data feed to get the current ETH/USD exchange rate (`ethUsd`). It then converts the Ether amount to USD (`amountUSD`), and calculates the amount of tokens (`amountToken`) that should be received based on the token price (`tokenPrice`). The purpose of this function is to calculate the amount of tokens that should be received for a given amount of Ether.

2. `receive` function: This is a special function that gets called when the contract receives Ether. It first uses the `tokenAmount` function to calculate the amount of tokens that should be received, then mints that amount of tokens to the sender using the `minter.mint` function. The purpose of this function is to automatically mint tokens to the sender when Ether is received.

3. `onlyOwner` modifier: This is a modifier that restricts certain functions to be called only by the owner of the contract. In this case, it's used on the `withdraw` function, meaning that only the owner of the contract can withdraw Ether from it.

4. `withdraw` function: This function can only be called by the owner of the contract, and it transfers all Ether in the contract to the owner's address. The purpose of this function is to allow the owner of the contract to withdraw Ether from it.

![image](https://github.com/Neil-Hong/Chargemate/blob/main/public/tokenshop.png)
