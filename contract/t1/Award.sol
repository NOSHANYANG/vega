pragma solidity ^0.8.0;

contract Award{
    IERC20 immutable token;

    constructor(address t){
        token = IERC20(t);
    }

    function sendAward(address user) public {
        token.transfer(user,100);
    }
}