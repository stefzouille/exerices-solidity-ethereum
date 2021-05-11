// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd {
    uint256 private _check;

    function check(uint256 value) public pure returns(bool){
        uint256 res = value % 2;
       if(res == 0) {
            return true;
       } else {
            return false;
       }
    }
}
