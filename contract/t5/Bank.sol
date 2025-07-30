pragma solidity ^0.8.10;

contract Bank {
    // 管理员地址
    address public admin;

    // 记录每个地址的存款金额
    mapping(address => uint256) public balances;

    // 存款金额前3名的地址数组
    address[3] public topDepositors;

    // 存款事件
    event Deposit(address indexed depositor, uint256 amount);

    // 提取事件
    event Withdraw(address indexed admin, uint256 amount);

    /**
     *   构造函数，设置部署者为管理员
     */
    constructor() {
        admin = msg.sender;
    }

    /**
     *   仅管理员修饰符
     */
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    /**
     *   存款函数，接收ETH并更新余额和排行榜
     */
    function deposit() external payable virtual {
        require(msg.value > 0, "Deposit amount must be greater than 0");

        // 更新用户余额
        balances[msg.sender] += msg.value;

        // 更新前3名排行榜
        updateTopDepositors(msg.sender, balances[msg.sender]);

        emit Deposit(msg.sender, msg.value);
    }

    /**
     *   更新前3名存款用户排行榜
     */
    function updateTopDepositors(address depositor, uint256 totalAmount) internal {
        bool isInTopThree = false;

        // 检查是否已在前3名中
        for (uint i = 0; i < 3; i++) {
            if (topDepositors[i] == depositor) {
                isInTopThree = true;
                break;
            }
        }

        if (isInTopThree) {
            // 如果已经在前3名中，直接返回，因为sortTopDepositors会处理排序
            sortTopDepositors();
        } else {
            // 如果不在前3名中，检查是否能进入前3名
            if (totalAmount > balances[topDepositors[2]]) {
                topDepositors[2] = depositor;
                sortTopDepositors();
            }
        }
    }

    /**
     *   对前3名进行降序排序
     */
    function sortTopDepositors() internal {
        for (uint i = 0; i < 2; i++) {
            for (uint j = i + 1; j < 3; j++) {
                if (balances[topDepositors[i]] < balances[topDepositors[j]]) {
                    // 交换地址
                    address tempAddress = topDepositors[i];
                    topDepositors[i] = topDepositors[j];
                    topDepositors[j] = tempAddress;
                }
            }
        }
    }

    /**
     *   管理员提取所有ETH
     */
    function withdraw() external onlyAdmin {
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "No funds to withdraw");

        // 转账给管理员
        payable(admin).transfer(contractBalance);

        emit Withdraw(admin, contractBalance);
    }

    /**
     *   获取合约当前余额
     */
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /**
     *   获取用户存款余额
     */
    function getUserBalance(address user) external view returns (uint256) {
        return balances[user];
    }

    /**
     *   获取前3名存款用户信息
     */
    function getTopDepositors() external view returns (address[3] memory) {
        return topDepositors;
    }

    /**
     *   转移管理员权限
     */
    function transferOwnership(address newAdmin) external onlyAdmin {
        require(newAdmin != address(0), "New admin cannot be zero address");
        admin = newAdmin;
    }
}
//owner:0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//contract:0xd9145CCE52D386f254917e481eB44e9943F39138