pragma solidity ^0.8.0;

contract Counter{
    uint public counter;
    address public sender;

    function count() public{
        counter += 1;
        sender = msg.sender;
    }
}

contract CallTest{
    uint public counter;
    address public sender;

    function lowCallCount(address addr) public {
        bytes memory methodData = abi.encodeWithSignature("count()");
        addr.call(methodData);
    }

    //只是调用合约代码，合约环境还是当前合约
    function lowDelegatecallCount(address addr) public {
        bytes memory methodData = abi.encodeWithSignature("count()");
        addr.delegatecall(methodData);
    }
}