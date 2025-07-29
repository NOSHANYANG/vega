// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Toy} from "./Toy.sol";

contract ToyFactory {

    event ToyCreated(address toyAddress);

    constructor(uint _modelNumber, bytes32 _salt) public {
        Toy toy = new Toy{_salt:_salt}(_modelNumber);
        emit ToyCreated(address(toy));
    }
}
