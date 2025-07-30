pragma solidity ^0.8.0;

contract Bank {

    address public owner;//管理员

    mapping(address => uint) public balances; //存款记录

    address[3] topDepositors;

    constructor(){
        owner = msg.sender;
    }

    //存款事件
    event Deposit(address indexed depositor, uint amount);
    //取款事件
    event WithDraw(address indexed withdrawer, uint amount);
    //所有权转移事件
    event OwnerShipTransferred(address indexed previousOwner, address indexed newOwner);

    receive() external payable{
        require(msg.value > 0, "deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
        _updateTopDepositors(msg.sender);
        emit Deposit(msg.sender,msg.value);
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"only owner can withdraw");
        _;
    }

    function transferOwnerShip(address newOwner) public onlyOwner{
        require(newOwner != address(0),"new owner is the zero address");
        emit OwnerShipTransferred(owner,newOwner);
        owner = newOwner;
    }

    function withdraw(uint amount) external onlyOwner {
        require(amount <= address(this).balance,"not sufficient funds");
        (bool ok,) = owner.call{value: amount}("");
        require(ok,"transfer failed");
        emit WithDraw(owner,amount);
    }

    function getTop3() external view returns (address[3] memory){
        return topDepositors;
    }

    function getBalance() external view returns (uint){
        return address(this).balance;
    }

    function _updateTopDepositors(address depositor) private {
        uint256 depositorBalance = balances[depositor];
        bool inserted = false;
        //从后往前遍历，插入到合适的位置
        for(int256 i = 2; i >= 0; i--){
            address current = topDepositors[uint256(i)];
            uint256 currentBalance = balances[current];
            //如果当前地址余额小于存款者余额，或者当前地址为空
            if(current == address(0) || depositorBalance > currentBalance){
                //将当前及之后的元素向后移动一位
                for(uint256 j = uint256(i); j < 2; j++){
                    topDepositors[j] = topDepositors[j+1];
                }
                //将存款者插入当前位置
                topDepositors[uint256(i)] = depositor;
                inserted = true;
                break;
            }//如果余额相等，不处理
            else if(depositorBalance == currentBalance && depositor == current){
                inserted = true;
                break;
            }
        }
    }
}