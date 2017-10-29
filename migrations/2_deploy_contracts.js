var EtherPriceOracle = artifacts.require("./EtherPriceOracle.sol");
const UPDATE_FREQUENCY = 300;

module.exports = function(deployer) {
  EtherPriceOracle.defaults({
    value: 10000000000000000
  });
  deployer.deploy(EtherPriceOracle, UPDATE_FREQUENCY);
}
