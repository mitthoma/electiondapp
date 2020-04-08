var my_Election = artifacts.require("./Election.sol");

module.exports = function(deployer) {
  deployer.deploy(my_Election);
};


