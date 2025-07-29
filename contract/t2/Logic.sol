// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Logic {

    address public logicAddress;

    uint public count;

    function incrementCounter() public {
        count += 1;
    }

    function getCount() public view returns (uint){
        return count;
    }
}
