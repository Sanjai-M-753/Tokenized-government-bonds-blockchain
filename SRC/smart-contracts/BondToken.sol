// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BondToken {

    string public bondName = "Government Bond Token";
    string public symbol = "GBT";

    uint public totalSupply;
    uint public interestRate = 5; // 5% interest

    address public owner;

    mapping(address => uint) public balanceOf;

    constructor() {
        owner = msg.sender;
    }

    // Buy fractional bond tokens
    function buyTokens(uint amount) public payable {
        require(amount > 0, "Invalid amount");
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
    }

    // View expected yield
    function calculateYield(address user) public view returns(uint) {
        uint principal = balanceOf[user];
        return (principal * interestRate) / 100;
    }

    // Redeem tokens
    function redeemTokens(uint amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }
}
