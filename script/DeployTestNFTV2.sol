// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import {TestNFTV2} from "../src/TestNFTV2.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";

contract DeployTestNFTV2 is Script {
    function run() external {
        // Fetch proxy address from an environment variable
        address proxyAddress = vm.envAddress("PROXY_ADDRESS");

        vm.startBroadcast();

        // Upgrade the proxy to TestNFTV2
        Upgrades.upgradeProxy(
            proxyAddress,
            "TestNFTV2.sol",
            ""
        );

        vm.stopBroadcast();
    }
}
