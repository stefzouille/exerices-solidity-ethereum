// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract PayableCalculator {
    
    // library usage
    using Address for address payable;
    
    // State variables
    mapping(address => uint256) private _balances;
    address private _owner;
    uint256 private _counter;
    
    // Events
    event Added(address indexed account, int256 res);
    
    // constructor
    constructor() {
        _owner = msg.sender;
    }
    
    modifier hasEnoughFinney() {
        require(msg.value >= 1e15, "PayableCalculator: not enought money, you need pay at least 1 finney to execute the function");
        _;
    }
    
    modifier isOwner(address user) {
        require(user == _owner, "PayableCalculator: you need to be the owner to be able to withdraw");
        _;
    }
    
    
    function add(int256 nb1, int256 nb2) public payable hasEnoughFinney returns(int256) {
        _balances[_owner] += msg.value;
        emit Added(msg.sender, nb1 + nb2);
        _counter++;
        return nb1 + nb2;
    }
    
    function sub(int256 nb1, int256 nb2) public payable hasEnoughFinney returns(int256) {
        _balances[_owner] += msg.value;
        emit Added(msg.sender, nb1 - nb2);
        _counter++;
        return nb1 - nb2;
    }
    
    function mul(int256 nb1, int256 nb2) public payable hasEnoughFinney returns(int256) {
        _balances[_owner] += msg.value;
        emit Added(msg.sender, nb1 * nb2);
        _counter++;
        return nb1 * nb2;
    }
    
    function div(int256 nb1, int256 nb2) public payable hasEnoughFinney returns(int256) {
        _balances[_owner] += msg.value;
        emit Added(msg.sender, nb1 / nb2);
        _counter++;
        return nb1 / nb2;
    }
    
    function mod(int256 nb1, int256 nb2) public payable hasEnoughFinney returns(int256) {
        _balances[_owner] += msg.value;
        emit Added(msg.sender, nb1 % nb2);
        _counter++;
        return nb1 % nb2;
    }
    
    
    function withdrawProfit() public isOwner(msg.sender) {
        require(_balances[_owner] > 0, "SmartWallet: can not withdraw 0 ether");
        uint256 amount = _balances[_owner];
        _balances[_owner] = 0;
        payable(msg.sender).sendValue(amount);
    }
    
    function seeProfit() public view returns(uint256) {
        return _balances[_owner];
    }
    
    function seeCounter() public view returns(uint256) {
        return _counter;
    }
}