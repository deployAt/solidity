//Sending ether safely

receiverAddress.send(value); //{ from: address(this) }
//safe aganist re-entrency
//becasue -> 2300 gas stipend
//limit for receiver SC to execute a fallback code
//can only throw an event within this gas (eg receivedPayment)
//no throws an error

receiverAddress.transfer(value);
//Safest
// == require(receiverAddress.send(value));
//throws an error
//safe aganist re-entrency
//same as send() but with a built in require
//revert on failure -> revert money and thro an error

receiverAddress.call.value(x)()
//unlimited gas to fallback
//useful in scanerio when own (trust) other contract
//and execute between them
