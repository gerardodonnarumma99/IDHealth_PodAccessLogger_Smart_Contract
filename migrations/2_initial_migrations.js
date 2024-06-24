const PodAccessLogger = artifacts.require("PodAccessLogger");

module.exports = function (deployer) {
 deployer.deploy(PodAccessLogger);
};