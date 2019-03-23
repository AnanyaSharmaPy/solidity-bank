pragma solidity ^0.4.0;

contract SimpleBank {

  mapping (address => uint) balances;

  address public owner;

  event LogDepositMade(address accountAddress, uint amount);

  function SimpleBank() {
    owner = msg.sender;
  }

  function deposit(uint dep_amt) public returns (uint) {
    balances[msg.sender] += dep_amt;

    LogDepositMade(msg.sender, dep_amt);

    return balances[msg.sender];
  }

  function withdraw(uint withdrawAmount) public returns (uint remainingBalance) {
    if(balances[msg.sender] >= withdrawAmount) {
      balances[msg.sender] -= withdrawAmount;
    }
    return balances[msg.sender];
  }

  function balance() constant returns (uint) {
    return balances[msg.sender];
  }

}