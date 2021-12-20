const Contract = artifacts.require("RealEstateContract");

module.exports = function (deployer) {
  deployer.deploy(Contract, "0x9DeA472e68A372E83D1D86D8be4AB440126bEf3C");
};

// const NFT = artifacts.require("House");

// module.exports = function (deployer) {
//   deployer.deploy(NFT);
// };
