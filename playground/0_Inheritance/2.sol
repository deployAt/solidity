pragma solidity 0.5.11;

contract A {
    event Log(string msg);

    function foo() public{
        emit Log('A.foo was called');
    }

   function bar() public{
        emit Log('A.bar was called');
    }
}

contract B is A {
    function foo() public{
        emit Log('B.foo was called');
        A.foo();
    }

   function bar() public{
        emit Log('B.bar was called');
        super.bar();
    }
}

contract C is A {
    function foo() public{
        emit Log('C.foo was called');
        A.foo();
    }

   function bar() public{
        emit Log('C.bar was called');
        super.bar();
    }
}

contract D is B, C {
    // 'C.foo', 'A.foo'
    // 'C.bar', 'B.bar', 'A.bar'
}
