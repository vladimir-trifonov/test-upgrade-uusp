// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import {TestNFTV1} from "../src/TestNFTV1.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";

contract DeployTestNFTV1 is Script {
    function run() external returns (address implementation, address proxy) {
        vm.startBroadcast();

        // Deploy UUPS Proxy for TestNFTV1
        proxy = Upgrades.deployUUPSProxy(
            "TestNFTV1.sol",
            abi.encodeCall(TestNFTV1.initialize, ())
        );

        // Get Implementation Address
        implementation = Upgrades.getImplementationAddress(proxy);

        vm.stopBroadcast();

        return (implementation, proxy);
    }
}
