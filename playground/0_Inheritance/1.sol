pragma solidity 0.5.11;

contract A {
    function foo() public pure returns(string memory) {
        return 'A';
    }
}

contract B {
    function foo() public pure returns(string memory) {
        return 'B';
    }
}

contract C is A, B {

}

contract D is A, C {
    // 'B'
}

// Linearization error
// contract D is C, A {

// }
