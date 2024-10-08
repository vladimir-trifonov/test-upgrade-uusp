// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

/// @custom:oz-upgrades-from TestNFTV1
contract TestNFTV2 is Initializable, ERC721URIStorageUpgradeable, OwnableUpgradeable, UUPSUpgradeable {
    using Strings for uint256;

    uint256 private nftCounter;
    uint256 public claimThreshold;

    // New state variable
    uint256 public newVariable;

    // Storage gap for future upgrades
    uint256[47] private __gap;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __ERC721_init("Test NFT", "TNFT");
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    // New function to set the new variable
    function setNewVariable(uint256 _newVar) external onlyOwner {
        newVariable = _newVar;
    }

    /**
     * @dev Authorizes the contract upgrade. Only the owner can upgrade the contract.
     */
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
