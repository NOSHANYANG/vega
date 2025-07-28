pragma solidity ^0.8.0;

import "./library/Math.sol";

contract TestMax {
    function max(uint x, uint y) public pure returns (uint) {
        return Math.max(x, y);
    }
}