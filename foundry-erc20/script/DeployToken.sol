// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {Script} from "forge-std/Script.sol";
import {AlpyToken} from "src/AlpyToken.sol";




contract DeployToken is Script{
       
       
    uint256 public constant INITIAL_SUPPLY = 1000 ether ;

    
    
    function run() external returns (AlpyToken) {
 
    vm.startBroadcast();
    AlpyToken AT = new AlpyToken(INITIAL_SUPPLY);
    vm.stopBroadcast();
    return AT;
    }

}

