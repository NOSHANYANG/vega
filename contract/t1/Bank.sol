pragma solidity ^0.8.0;

contract Bank {

    address public immutable owner;//管理员

    mapping(address => uint) public balances; //存款记录

    address[3] top_3; //top3

    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "存款金额为0");
        balances[msg.sender] += msg.value;
        retop(msg.sender);
    }

    function transfer(uint x) public payable {
        balances[msg.sender] = x;
    }

    function withdraw() {

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