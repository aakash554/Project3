// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
contract demo{
    // Function using require
    function divide1 (int a,int b)public pure returns (int) {
        require(b!=0,"B cannot be zero");
        return a/b;
    }
    // Function using revert
    function divide2 (int a,int b)public pure returns (int) {
        if(b==0){
            revert("B cannot be zero");
        }
        return a/b;
    }
    // Function using assert
    function divide3 (int a,int b)public pure returns (int) {
        assert(b!=0);
        return a/b;
    }
}
