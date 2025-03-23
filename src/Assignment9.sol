// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Assignment9 is Ownable {
    address[] public deployedContracts;

    constructor() Ownable(msg.sender) {}

    function createContract() external onlyOwner {
        SimpleContract newContract = new SimpleContract(100);
        deployedContracts.push(address(newContract));
    }
}

contract SimpleContract {
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }
}
