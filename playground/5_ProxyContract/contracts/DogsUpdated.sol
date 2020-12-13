pragma solidity 0.5.2;

import "./Storage.sol";

contract DogsUpdated is Storage {
  //NO state variables! (will overwrite Proxy variables)
  //-> delegated calls to this contract, not from
  // uint256 test;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  constructor() public {
    //doesn't work coz it's called from the deployer not delegated CALL
    //its set in a scope of Storage(DogsUpdated) not Storage(Proxy)
    //owner = msg.sender;

    //no need it here, no harm, but use just to reduce the attack surface
    //so noone can call .initialize() and become the owner of this contract
    //even that all the data is in the Storage(Proxy) not here.
    initialize(msg.sender);
  }

  function initialize(address _owner) public {
    //more flexibility here rather than put everything in Proxy constructor
    //To set the init values from the constuctor of Functional Contract
    //inside the Stroage(Proxy)
    require(!_initialized);
    owner = _owner;
    //to run function only 1 time
    //onlyOwner can't be used coz its not set up yet
    _initialized = true;
  }

  function getNumberOfDogs() public view returns(uint256) {
    //only contains data from the view of the Proxy -> Storage(Proxy)
    return _uintStorage["Dogs"];
  }

  function setNumberOfDogs(uint256 toSet) public onlyOwner {
     _uintStorage["Dogs"] = toSet;
  }





}
