// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Assignment9, SimpleContract} from "../src/Assignment9.sol";

contract Assignment9Test is Test {
    Assignment9 assignment;
    address owner = address(this); // Test contract as owner

    function setUp() public {
        assignment = new Assignment9();
        assertEq(assignment.owner(), owner, "Owner should be test contract");
    }

    function testFactoryPattern() public {
        assignment.createContract();
        address deployed = assignment.deployedContracts(0);

        SimpleContract simple = SimpleContract(deployed);
        simple.setValue(42);

        uint256 value = simple.value();
        assertEq(value, 42, "Value should be 42");
    }

    function testOnlyOwnerCanCreateContract() public {
        vm.prank(address(0x1234));
        vm.expectRevert("Ownable: caller is not the owner");
        assignment.createContract();
    }
}
