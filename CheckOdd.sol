// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd {
    

    function check(uint256 value) public pure returns(bool){
        uint256 res = value % 2;
       if(res != 0) {
            return true;
       } else {
            return false;
       }
    }
}
// ou simplement return value % 2 == 0 ? false : true;