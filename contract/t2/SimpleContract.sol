// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract SimpleContract {
    address payable public owner;
    constructor(){
        owner = msg.sender;
    }

    //接收以太币的函数
    function deposit() public payable{

    }

    function destroy() public {
        require(msg.sender == owner,"You are not the owner");
        selfdestruct(payable(owner));
    }
}
