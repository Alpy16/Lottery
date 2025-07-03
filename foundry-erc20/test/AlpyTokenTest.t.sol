//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AlpyToken} from "src/AlpyToken.sol";
import {Test} from "forge-std/Test.sol";
import {DeployToken} from "script/DeployToken.sol";

contract AlpyTokenTest is Test {
    
    AlpyToken public alpyToken;
    DeployToken public deployer;

    address bob = makeAddr("Bob");
    address larry = makeAddr("Larry");

    uint256 public constant STARTING_BALANCE = 100 ether;
    
    

    function setUp() public {
        deployer = new DeployToken();
        alpyToken = deployer.run();

                vm.prank(msg.sender);
        alpyToken.transfer(bob, STARTING_BALANCE);
        
    }

    function testBobBalance() public view {
    assertEq(STARTING_BALANCE, alpyToken.balanceOf(bob));
    }
    function testLarryBalance() public view {
        assertEq(0, alpyToken.balanceOf(larry));
    }

    function testAllowance() public {
        vm.prank(bob);
        alpyToken.approve(larry, STARTING_BALANCE);

        uint256 transferAmount  = 5 ether;

        vm.prank(larry);
        alpyToken.transferFrom(bob, larry, transferAmount);
        assertEq(alpyToken.balanceOf(larry), transferAmount);
        assertEq(alpyToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        
    }
        function testTransferWithoutApprovalFails() public {
    uint256 transferAmount = 1 ether;

    vm.prank(larry);
    vm.expectRevert(abi.encodeWithSignature(
        "ERC20InsufficientAllowance(address,uint256,uint256)",
        larry,
        0,
        transferAmount
    ));
    alpyToken.transferFrom(bob, larry, transferAmount);
}


    function testCannotTransferMoreThanAllowance() public {
    uint256 allowanceAmount = 2 ether;
    uint256 transferAmount = 3 ether;

    vm.prank(bob);
    alpyToken.approve(larry, allowanceAmount);

    vm.prank(larry);
    vm.expectRevert(abi.encodeWithSignature(
        "ERC20InsufficientBalance(address,uint256,uint256)",
        larry,
        allowanceAmount,
        transferAmount
    ));
    alpyToken.transferFrom(bob, larry, transferAmount);
}


    function testApproveOverridesPreviousValue() public {
        // Bob approves 10 ether, then changes it to 1 ether
        vm.prank(bob);
        alpyToken.approve(larry, 10 ether);

        vm.prank(bob);
        alpyToken.approve(larry, 1 ether);

        assertEq(alpyToken.allowance(bob, larry), 1 ether);
    }

}
