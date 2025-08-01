// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

/**
编写一个 TokenBank 合约，可以将自己的 Token 存入到 TokenBank， 和从 TokenBank 取出。

TokenBank 有两个方法：

deposit() : 需要记录每个地址的存入数量；
withdraw（）: 用户可以提取自己的之前存入的 token。
 */
contract TokenBank is ERC20{
    constructor(){

    }

    constructor() ERC20("veta space", "veta"){
        _mint(msg.sender,10000*10**18);
    }
}
