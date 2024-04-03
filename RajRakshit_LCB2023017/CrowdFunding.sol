// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; 

contract Crowdfunding {
    address public owner;
    uint public target;
    mapping (address => uint) public fundings;
    uint public totalFunds;

    event Fund(address provider, uint amount);
    event FundingSuccessful(uint totalFunds);
    event FundingFailed(uint totalFunds);

    constructor(uint _target){
        owner = msg.sender;
        target = _target;
    }

    function addFunds() public payable {
        
        fundings[msg.sender] += msg.value;
        totalFunds += msg.value;
        emit Fund(msg.sender, msg.value);
    }

    function getFunds() public payable {
        require(owner==msg.sender);
        require(totalFunds>=target);
        payable(owner).transfer(address(this).balance);
        emit FundingSuccessful(totalFunds);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }


}