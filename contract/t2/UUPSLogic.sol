// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract UUPSLogic {
    address public logicAddress;
    address public adminAddress;
    uint public count;

    function incrementCounter() public {
        count += 1;
    }

    function getCount() public view returns (uint) {
        return count;
    }

    function upgrade(address newLogic) public {
        require(msg.sender == adminAddress, "Only admin");
        logicAddress = newLogic;
    }
}
