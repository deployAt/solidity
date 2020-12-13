pragma solidity 0.5.1;

import "./Storage.sol";

//Functional Contract
//diffrance instanceOf Storage(ProxyDog)
//used here as an interface here, r
//real data in Storage(ProxyDog)
contract Dogs is Storage {

  function getNumberOfDogs() public view returns(uint256) {
    return Storage.getNumber();
  }

  function setNumberOfDogs(uint256 toSet) public {
    //Storage.setNumber(toSet + 1); bug
    Storage.setNumber(toSet);
  }
}
