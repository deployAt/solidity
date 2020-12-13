//—————————————————— Insecure code ——————————————————
//bug -> can clear SC from all etheres that it holds
//this = SC-A
//hacker = SC-B

mapping(address => uint) private balances;

function withdrawAll() public {
  uint amountToWithdraw = balances[msg.sender];
  //called by SC-B which has a fallback function
  //which execute code in SC-B
  //whenever ether is sent to SC-B
  //eg. function(...SC-A.withdrawAll()) -> loop calling
  //fallback -> function() payable { ... }
  require(msg.sender.call.value(amountToWithdraw));
  balances[msg.sender] = 0;
}


//—————————————————— Solutions ——————————————————
//Check-Effects-Interactions Pattern
mapping(address => uint) private balances;

function withdrawAll() public {
  //Check
  uint amountToWithdraw = balances[msg.sender];
  //Effects
  balances[msg.sender] = 0;
  //Interaction
  require(msg.sender.call.value(amountToWithdraw));
}
