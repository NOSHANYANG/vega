// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract TestA {
    address public owner;

    int public count = 0;

    event ADDRESS(address sender, address contractAddress);

    constructor(){
        owner = msg.sender;
        emit ADDRESS(msg.sender,address(this));
    }

    function transferOwnerShip(address newOwner) public {
        owner = newOwner;
    }

    function counter() public onlyAdmin returns (int)  {
        return count++;
    }

    modifier onlyAdmin() {
        require(msg.sender == owner, "Only admin can call this function");
        _;
    }
}
//EOA：0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//ctrt：0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc