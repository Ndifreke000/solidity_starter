
// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract HelloWorld {
    string public greet = "Hello World!";
}
contract AdvancedSmarContract {
    address public owner,
    unit256 public contractBalance;

    constructor() {
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can call this function");

    }
    function deposit() external payable {
        contractBalance += msg.value;
    }

    function withdraw(unit256 amount) external onlyOwner{
        assert(amount <= contractBalance);

        if (amount > contractBalance) {
            revert("Revert Statement: Insufficient funds");
        }

        require(amount > 0, "Require Statement: Withdrawal must be greater than zero");
        payable(owner).transfer(amount);
        contractBalance -= amount;
    }
    function complexOperation(unit256 x,unit256 y) externalonlyOwner {
        assert(x>y);
        if (x<=y) {
            revert("Revert Statement: Condition not met");
        }
        require (x + y > 10, "Require Statement:Sum most be greater than 10"),
    }
    
}
