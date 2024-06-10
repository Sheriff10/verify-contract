# HOW TO FLATTEN CONTRACT

## Step 1: Change Compiler Version
Ensure you change the compiler version to the pragma version specified in your Solidity contract.

## Step 2: Install Dependencies
Run the following commands to install the necessary dependencies. Use `sudo` or run the command prompt as an administrator if needed:

```sh
npm install --save-dev hardhat
npm install --save-dev @nomiclabs/hardhat-waffle ethereum-waffle
npm install --save-dev @nomiclabs/hardhat-ethers ethers
npm install --save-dev @nomiclabs/hardhat-etherscan
```

## Step 3: Configure Hardhat
In your hardhat.config.js file, add the following lines to require the necessary plugins and set up your configuration:


```sh
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

module.exports = {
  solidity: "0.8.20",
  networks: {
    bsctestnet: {
      url: `https://data-seed-prebsc-1-s1.binance.org:8545/`,
      accounts: [WALLET_PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: "BSC_API_KEY"
  }
};
```

Replace `WALLET_PRIVATE_KEY` with your actual wallet private key and `BSC_API_KEY` with your BSC API key.


## Step 4: Flatten the Contract
Run the following command to flatten your contract:

```sh
npx hardhat flatten contracts/YOUR_CONTRACT_NAME.sol > YOUR_CONTRACT_NEW_NAME.sol
```# verify-contract
