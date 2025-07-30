// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Bank} from "./Bank.sol";

contract BigBank is Bank{
    constructor(){
        msg.sender = super.owner;
    }

    modifier onlyBigDeposit(){
        require(msg.value > 0.001 ether,"Deposit must be greater than 0.001 ether");
        _;
    }

    //重写receive
    receive() external payable override onlyBigDeposit {
        balances[msg.sender] += msg.value;
        _updateTopDepositors(msg.sender);
        emit Deposit(msg.sender,msg.value);
    }
}
