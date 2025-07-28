pragma solidity ^0.8.0;

import "../library/Search.sol";

contract TestSearch{
    using Search for uint[];
    uint[] data;

    function append(uint value) public {
        data.push(value);
    }

    function replace(uint _old, uint _new) public {
        uint index = data.indexOf(_old);
        if(index == uint(-1)){
            data.push(_new);
        }else{
            data[index] = _new;
        }
    }
}