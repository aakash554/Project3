// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
contract MyToken {
    // public variables here
    string public Currency = "INR";
    address public owner;

    // mapping variable here
    mapping (address => uint ) public Available;

    // Making Owner 
    constructor(){
        owner=msg.sender;
    }

    // mint function

    function Deposit(uint money) public{
        require(money>0,"Deposit Should be greater than Zero");
        Available[owner] += money;
    }

    // burn function
    function Withdraw(uint money) public{
        if(money>Available[owner]){
            revert("Withdrawl Balance must be greater than Available balance");
        }
        Available[owner] -= money;
        
    }
    // Transfer Function
    function transfer(address addres,uint amount)public {
        assert(amount<Available[owner]);
        Available[addres] += amount;
        Available[owner] -= amount;
    }

    // Balance function
    function Balance(address addres) public view returns (uint){
        return Available[addres];
    }
}
