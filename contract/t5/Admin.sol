pragma solidity ^0.8.10;

import "./BigBank.sol";

/**
 * @title Admin管理合约
 * @dev 用于管理BigBank合约的提取操作
 */
contract Admin {
    // 管理员地址
    address public owner;

    // BigBank合约实例
    BigBank public bigBank;

    // 提取事件
    event WithdrawFromBank(address indexed bank, uint256 amount);

    //管理员更换事件
    event TransferOwnerShip(address indexed oldOwner, address indexed newOwner);

    /**
     * @dev 构造函数
     * @param _bigBankAddress BigBank合约地址
     */
    constructor(address _bigBankAddress) {
        owner = msg.sender;
        bigBank = BigBank(_bigBankAddress);
    }

    /**
     * @dev 仅所有者修饰符
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    /**
     * @dev 从BigBank合约提取所有ETH
     * @notice 只有合约所有者可以调用
     */
    function withdrawFromBank() external onlyOwner {
        uint256 bankBalance = bigBank.getContractBalance();
        require(bankBalance > 0, "No funds in bank to withdraw");

        // 调用BigBank的withdraw函数
        bigBank.withdraw();

        emit WithdrawFromBank(address(bigBank), bankBalance);
    }

    /**
     * @dev 设置新的BigBank合约地址
     * @param _newBigBankAddress 新的BigBank合约地址
     */
    function setBigBank(address _newBigBankAddress) external onlyOwner {
        require(_newBigBankAddress != address(0), "Invalid address");
        bigBank = BigBank(_newBigBankAddress);
    }

    /**
     * @dev 转移所有者权限
     * @param newOwner 新所有者地址
     */
    function transferOwnership(address newOwner) external onlyOwner {
        address oldOwner = bigBank.admin();
        bigBank.transferOwnership(newOwner);
        emit TransferOwnerShip(oldOwner,newOwner);
    }

    /**
     * @dev 获取BigBank合约余额
     * @return BigBank合约当前余额
     */
    function getBankBalance() external view returns (uint256) {
        return bigBank.getContractBalance();
    }

    /**
     * @dev 接收ETH函数
     */
    receive() external payable {}
}

//0x7b96aF9Bd211cBf6BA5b0dd53aa61Dc5806b6AcE