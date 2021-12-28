// const NFT = artifacts.require("House");

// module.exports = function (deployer) {
//   deployer.deploy(NFT);
// };

const Contract = artifacts.require("RealEstateContract");

module.exports = function (deployer) {
  deployer.deploy(Contract, "0x5575bEF14b31978B2543Ad55fef2C75aB044eB77");
};
