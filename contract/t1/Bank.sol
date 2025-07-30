pragma solidity ^0.8.0;

contract Bank {

    address public immutable owner;//管理员

    mapping(address => uint) public balances; //存款记录

    address[3] top_3; //top3

    constructor(){
        owner = msg.sender;
    }

    event Deposit(address indexed user, uint amount);
    event WithDraw(address indexed to, uint amount);

    function deposit() external payable {
        require(msg.value > 0, "invalid money");
        balances[msg.sender] += msg.value;
        retop(msg.sender);
        emit Deposit(msg.sender,msg.value);
    }

    receive() external payable{
        require(msg.value > 0, "invalid money");
        balances[msg.sender] += msg.value;
        retop(msg.sender);
        emit Deposit(msg.sender,msg.value);
    }

    function withdraw(uint amount) external onlyOwner {
        require(amount <= address(this).balance,"not sufficient funds");
        (bool ok,) = owner.call{value: amount}("");
        require(ok,"transfer failed");
        emit WithDraw(owner,amount);
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"not manager");
        _;
    }

    function totalBalance() external returns(uint256) {
        return address(this).balance;
    }

    function getTop3() external view returns (address[3] memory){
        return top_3;
    }

    function getBalance() external view returns (uint){
        return address(this).balance;
    }

    function retop(address user) public {
        uint b0 = balances[top_3[0]];
        uint b1 = balances[top_3[1]];
        uint b2 = balances[top_3[2]];
        uint b_user = balances[user];

        if(b_user > b0){
            top_3[2] = top_3[1];
            top_3[1] = top_3[0];
            top_3[0] = user;
        } else if(b_user> b1){
            top_3[2] = top_3[1];
            top_3[1] = user;
        } else if(b_user > b2){
            top_3[2] = user;
        }
    }
}
//owner:0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//contract:0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8

//user1:0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//user2:0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db