// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/forge-std/lib/ds-test/src/test.sol";
import "../src/blacksmith.sol";

contract User {
    function callOnlyOwner(Blacksmith black) public view{
        black.onlyOwner();
    }
}

contract BlacksmithTest is DSTest {
    Blacksmith blacksmith;
    User user;

    function setUp() public {
        blacksmith = new Blacksmith(address(this));
        user = new User();
    }

    function testOwner() public {
        assertEq(blacksmith.owner(), address(this));
    }

    function testFailOwner() public view {
        user.callOnlyOwner(blacksmith);
    }   

    function testWrongOwner() public view {
        user.callOnlyOwner(blacksmith); //this test will fail
    }

}