contract Bank {

  mapping(address => uint) balances;
  bool private _paused;

  constructor() internal {
    _paused = false;
  }

  //allow to execute when contrac is not paused
  modifier whenNotPaused() {
    require(!_paused);
    _;
  }

  modifier whenPaused() {
    require(_paused);
    _;
  }

  function pause() public onlyOwner whenNotPaused {
    _paused = true;
  }

  function unPause() public onlyOwner whenNotPaused {
    _paused = false;
  }

  function withdrawAll() public whenNotPaused {
    //logic
  }

  function emergencyWithdrawal(address emergencyAddress) public onlyOwner whenPaused {
    //withdraw to the owner
    //one of many scerions handling emergency cases
    //be transparent
  }

}
