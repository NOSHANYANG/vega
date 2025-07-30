// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {BigBank} from "./BigBank.sol";

contract Admin {
    BigBank public bigBank;

    constructor(address _bigBankAddress){
        bigBank = BigBank(_bigBankAddress);
    }

    function withdrawFromBank(uint256 amount) public {
        bigBank.withdraw(amount);
    }
}
