//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract PayableCalculator {
    mapping(address => uint256) private _balances;
     address private _owners;
    uint256 public _price = 10^15;
    using Address for address payable;
    
    function checkPrice(send) public {
        require(send = _price);
    }
    
    
   function add(int256 a, int256 b) public payable returns (int256)  {
       checkPrice(msg.value);
        return a + b;
    }
        
        
    

    function sub(int256 a, int256 b) public payable returns (int256) {
        checkPrice(msg.value);
        return a - b;
    }

    function mul(int256 a, int256 b) public payable returns (int256) {
        checkPrice(msg.value);
        return a * b;
    }

    function div(int256 a, int256 b) public payable returns (int256) {
        checkPrice(msg.value);
        require(b != 0, "Calc: can not devide by 0 ");

        return a / b;
    }
    
       function mod(int256 a, int256 b) public payable returns (int256) {
           checkPrice(msg.value);
           require(b != 0, "Calc: can not modulo by 0 ");
        return a % b;
    }
    
     function _deposit(address sender, uint256 amount) private {
        _balances[sender] += amount;
    }
    
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
    
     function withdraw() public {
        uint256 amount = _balances[msg.sender];
        payable(msg.sender).sendValue(amount);
    }
}