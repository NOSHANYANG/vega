pragma solidity ^0.8.0;

contract Counter{
    uint public counter;
    address public sender;

    function count() public{
        counter += 1;
        sender = msg.sender;
    }
}

