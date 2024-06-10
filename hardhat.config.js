require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");


module.exports = {
  solidity: "0.8.20",
  networks: {
    bsctestnet: {
      url: `https://data-seed-prebsc-1-s1.binance.org:8545/`,
      accounts: [`0x60e1b1788430dc03d39c03a890bc4c76478aa118af9a784ba16be291a208d5ec`],
    },
  },
  etherscan: {
    apiKey: "DHYDEMXXP7XVFVNRCDDNR5A3CAQNGP5IDJ"
  }
};
