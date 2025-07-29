// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Proxy {

    address public logicAddress;

    uint public count;

    constructor(address _logic){
        logicAddress = _logic;
    }

    //确保只有可信的地址可以更新逻辑合约地址
    function upgradeLogic(address _newLogic) public {
        logicAddress = _newLogic;
    }

    fallback() external payable{
        _fallback(logicAddress);
    }

    receive() external payable {
        _fallback(logicAddress);
    }

    function _fallback(address logic) internal {
        //通过delegatecall 调用逻辑合约的函数，并返回数据
        //assembly 允许编写evm汇编代码
        assembly {
            calldatacopy(0,0,calldatasize())

            let result := delegatecall(gas(),logic,0,calldatasize(),0,0)

            returndatacopy(0,0,returndatasize())

            switch result
                case 0 {
                    revert(0, returndatasize())
                }
                default {
                    return(0,returndatasize())
            }
        }
    }
}
