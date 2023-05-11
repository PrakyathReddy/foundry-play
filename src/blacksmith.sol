// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract Blacksmith {
    address public owner;
    constructor (address _owner) {
        owner = _owner;
    }
    function onlyOwner() public view {
        require(msg.sender == owner, "not the owner");
    }
}
