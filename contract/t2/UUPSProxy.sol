// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract UUPSProxy {

    address public logicAddress;
    address public adminAddress;
    uint public count;

    constructor(address logic){
        logicAddress = logic;
        adminAddress = msg.sender;
    }

    fallback() external payable {
        _fallback(logicAddress);
    }

    receive() external payable {
        _fallback(logicAddress);
    }

    function _fallback(address logic) internal{
        assembly {
        // Copy msg.data. We take full control of memory in this inline assembly
        // block because it will not return to Solidity code. We overwrite the
        // Solidity scratch pad at memory position 0.
            calldatacopy(0, 0, calldatasize())

        // Call the implementation.
        // out and outsize are 0 because we don't know the size yet.
            let result := delegatecall(gas(), logic, 0, calldatasize(), 0, 0)

        // Copy the returned data.
            returndatacopy(0, 0, returndatasize())

            switch result
            // delegatecall returns 0 on error.
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }
}
