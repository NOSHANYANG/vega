// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {TestA} from "./TestA.sol";

contract TestB {

    address public owner;

    TestA contractA;

    event ADDRESS(string sender, string contractAddress);
    constructor(address aAddress){
        owner = msg.sender;
        //B合约需要持有A合约的引用，才能调用A合约的方法，但是A合约的owner是合约的部署人，B合约无法调用，所以需要将A合约的owner更新为B合约的address，才可以调用
        contractA = TestA(aAddress);
        emit ADDRESS("EOA地址："+msg.sender,"合约地址："+address(this));
    }

    function testCallContractA() public returns (int) {
        return contractA.counter();
    }
}
//EOA：0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//ctr：0xC3Ba5050Ec45990f76474163c5bA673c244aaECA


//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//0x3c725134d74D5c45B4E4ABd2e5e2a109b5541288

