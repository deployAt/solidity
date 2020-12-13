//PUSH VS PULL

//Push -> Push funds to user
//Pull -> Let user pull out funds themselves


//Example of Push (Bad)
function play() public {
  //game logic
  if(win) {
    player.transfer(prize);
  }
}

//Example of Pull (Good)
mapping(address => uint) prizes;

function play() public {
  //game logic
  if(win) {
    prizes[player] = prize;
  }
}

//let the user withdraw funds
function getPrize() public {
  //Check-Effects-Interactions
  uint prize = prizes[msg.sender];
  prizes[msg.sender] = 0;
  msg.sender.transfer(prize);
}
