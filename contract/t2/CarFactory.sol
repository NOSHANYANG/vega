// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Car} from "./Car.sol";

contract CarFactory {
    Car[] private cars;

    function creatCar(string memory _model) public{
        Car car = new Car(_model,msg.sender);
        cars.push(car);
    }

    function getCarsCount() public view returns (uint) {
        return cars.length;
    }
}
