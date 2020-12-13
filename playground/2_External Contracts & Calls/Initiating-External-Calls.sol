//Caling external functions
//calling from Contract A (this) -> Contract B

ContractB.call(...)
//call function in external Contract B
//using Contract B scope
//No throwing errors if failed
//returns true/false
//eg. ContractB.call(bytes4(sha3("someFunction(uint256)")), 100)


ContractB.callcode(...)
//call function in external Contract B
//using Contract A (!!!) scope
//No throwing errors if failed
//returns true/false
//has a bug that is fixed in .delegatecall(...)

ContractB.delegatecall(...)
//call function in external Contract B
//using Contract A (!!!) scope
//No throwing errors if failed
//returns true/false
//fixed bug from callcode(...)

ContractB.someFunction(...)
//SAFEST SHOULD BE ALWAYS USED
//call function in external Contract B
//using Contract B scope
//Throwing errors if failed
