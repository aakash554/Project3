# Project 3

# MyToken Smart Contract: Understanding Error Handling

This document explains the use of `require`, `assert`, and `revert` in the MyToken smart contract.

## Error Handling in Solidity

Solidity provides three functions for error handling: `require`, `assert`, and `revert`. Each serves a specific purpose in ensuring contract integrity and proper execution.

### 1. require()

`require()` is used for input validation and checking conditions that should be met for the function to proceed.

#### Usage in MyToken:

```solidity
function Deposit(uint money) public {
    require(money > 0, "Deposit Should be greater than Zero");
    Available[owner] += money;
}
```
### 2. revert()

`revert()` is used to flag an error and revert the current call. It can provide a reason for the revert.

### Usage in MyTokens

```solidity
function Withdraw(uint money) public {
    if(money > Available[owner]) {
        revert("Withdrawl Balance must be greater than Available balance");
    }
    Available[owner] -= money;
}
```
### 3. assert()

`assert()` is used to check for internal errors and invariants. It should only fail in case of a bug in the code.

### Usage in MyTokens

```solidity
function transfer(address addres, uint amount) public {
    assert(amount < Available[owner]);
    Available[addres] += amount;
    Available[owner] -= amount;
}
```

## Authors

Contributors names and contact info

Aakash Sharma  
(aakasharma5504@gmail.com)
