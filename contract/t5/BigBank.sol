pragma solidity ^0.8.10;

import {Bank} from "./Bank.sol";

contract BigBank is Bank{
    //存款最小金额
    uint256 public constant MIN_DEPOSIT = 0.001 ether;

    modifier minDeposit(){
        require(msg.value >= MIN_DEPOSIT, "Minimum deposit is 0.001 ether");
        _;
    }

    /**
     * 重写存款函数，添加最小金额限制
     */
    function deposit() external payable override minDeposit{
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
        updateTopDepositors(msg.sender,balances[msg.sender]);
        emit Deposit(msg.sender, msg.value);
    }
}

//0xD4Fc541236927E2EAf8F27606bD7309C1Fc2cbee