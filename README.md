# Project 3

## Overview

The demo contract implements basic arithmetic functions for dividing two integers using different error handling mechanisms in Solidity. It includes functionalities to perform division while ensuring that the divisor is not zero, using require, revert, and assert statements. This contract can be deployed and tested using Remix, an online Solidity IDE. To get started, go to the Remix website.

## Contract Details

- **Contract Name:** Demo
  
## Functions

### divide1
This function performs division of two integers and uses the `require` statement to ensure that the divisor is not zero.

**Parameters:**
- `int a`: The dividend.
- `int b`: The divisor.

**Returns:**
- `int`: The result of the division.
  
**Usage:**
```solidity
function divide1 (int a,int b)public pure returns (int)  {
        require(b!=0,"B cannot be zero");
        return a/b;
    }
```
### divide2
This function performs division of two integers and uses the `revert` statement to ensure that the divisor is not zero.

**Parameters:**
- `int a`: The dividend.
- `int b`: The divisor.

**Returns:**
- `int`: The result of the division.
  
**Usage:**
```solidity
function divide2 (int a,int b)public pure returns (int) {
        if(b==0){
            revert("B cannot be zero");
        }
        return a/b;
    }
```
### divide3
This function performs division of two integers and uses the `assert` statement to ensure that the divisor is not zero.

**Parameters:**
- `int a`: The dividend.
- `int b`: The divisor.

**Returns:**
- `int`: The result of the division.
  
**Usage:**
```solidity
function divide3 (int a,int b)public pure returns (int) {
        assert(b!=0);
        return a/b;
    }
```

## Authors

Contributors names and contact info

Aakash Sharma  
(aakasharma5504@gmail.com)
