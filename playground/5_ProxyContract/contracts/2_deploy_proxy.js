const Dogs = artifacts.require("Dogs");
const DogsUpdated = artifacts.require("DogsUpdated");
const Proxy = artifacts.require("Proxy");

module.exports = async function (deployer, network, accounts) {
  const dogs = await Dogs.new()
  const proxy = await Proxy.new(dogs.address)

  //truffle error -> func doesnt exists in Proxy wich is true
  //work around to fool truffle -> .at(...)
  //await proxy.setNumberOfDogs(10);
  // .at -> create an instance from already existed deployed contract
  var proxyDog = await Dogs.at(proxy.address)

  //set dogs through proxy
  await proxyDog.setNumberOfDogs(10)

  //tested
  var nrOfDogs = await proxyDog.getNumberOfDogs()
  console.log('before update ', nrOfDogs.toNumber()) // -> 10

  //deploy new version of Dogs
  //upgrade -> add owner to setNumberOfDogs()
  const dogsUpdated = await DogsUpdated.new()
  proxy.upgrade(dogsUpdated.address)

  //fool truffle once again. It now thinks proxyDog has all functions
  proxyDog = await DogsUpdated.at(proxy.address)
  //initialize proxy state
  proxyDog.initialize(accounts[0])

  //check so that storage remains
  var nrOfDogs = await proxyDog.getNumberOfDogs()
  console.log('after update ', nrOfDogs.toNumber()) // -> 10

  //set the nr of dogs through the proxy with NEW FUNC CONTRACT
  await proxyDog.setNumberOfDogs(30)
  //doesnt work coz of updated onlyOwner modifier (good)
  //await proxyDog.setNumberOfDogs(30, { from: accounts[1] })

  //check so that setNumberOdDogs worked with new func contract
  var nrOfDogs = await proxyDog.getNumberOfDogs()
  console.log('after change ', nrOfDogs.toNumber()) // -> 30

};
