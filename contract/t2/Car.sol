// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Car {
    string public model;
    address public owner;

    constructor(string memory _model, address _owner){
        model = _model;
        owner = _owner;
    }

    function getModel() public view returns (string memory){
        return model;
    }
}
