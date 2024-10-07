// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {CutTerminusDiamond} from "./CutTerminusDiamond.sol";
import {IERC20} from "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import {ResourceLocatorSetterDiamond} from "../../lib/cu-osc-common/src/implementations/ResourceLocatorSetterDiamond.sol";

/// @title Dummy "implementation" contract for LG Diamond interface for ERC-1967 compatibility
/// @dev adapted from https://github.com/zdenham/diamond-etherscan?tab=readme-ov-file
/// @dev This interface is used internally to call endpoints on a deployed diamond cluster.
contract CutTerminusDiamondTestnet is
    CutTerminusDiamond,
    ResourceLocatorSetterDiamond
{
    struct OwnerBadgeMint {
        address to;
        uint256[] tokenPools;
        uint256[] amounts;
    }

    /// @notice Mint one badge from a given pool and deliver it to a target address.
    /// @dev Caller must own `migrator` access badge
    /// @param to The address to receive the badge
    /// @param tokenPool The ID of the pool
    /// @custom:emits TransferSingle
    function migrateMintBadge(address to, uint256 tokenPool) external {}

    /// @notice Mint multiple copies of a badge from a given pool and deliver them to a target address.
    /// @dev Caller must own `migrator` access badge
    /// @param to The address to receive the badge
    /// @param tokenPool The ID of the pool
    /// @param amount The number of badges to mint
    /// @custom:emits TransferSingle
    function migrateMintBadges(
        address to,
        uint256 tokenPool,
        uint256 amount
    ) external {}

    /// @notice Mint one badge from multiple pools and deliver them to a target address.
    /// @dev Caller must own `migrator` access badge
    /// @param to The address to receive the badge
    /// @param tokenPools The IDs of the pools (ex: [1, 2, 3])
    /// @custom:emits TransferSingle
    function migrateMintMultipleBadge(
        address to,
        uint256[] memory tokenPools
    ) external {}

    /// @notice Mint multiple badges from multiple pools and deliver them to a target address.
    /// @dev Caller must own `migrator` access badge
    /// @param to The address to receive the badges
    /// @param tokenPools The IDs of the pools (ex: [1, 2, 3])
    /// @param amounts The number of badges to mint for each pool (ex: [10, 10, 10])
    /// @custom:emits TransferSingle
    function migrateMintMultipleBadges(
        address to,
        uint256[] memory tokenPools,
        uint256[] memory amounts
    ) external {}

    /// @notice Mint multiple badges from multiple pools and deliver them to multiple addresses.
    /// @dev Caller must own `migrator` access badge
    /// @param ownersMints The addresses to receive the badges and the badges to mint for each address
    /// @custom:emits TransferSingle
    function migrateMintMultipleOwners(
        OwnerBadgeMint[] memory ownersMints
    ) external {}

    /// @notice Mint one item from a given pool and deliver it to a target address.
    /// @dev Caller must have `debugger` or `admin` role
    /// @param to The address to receive the item
    /// @param tokenPool The ID of the pool
    /// @custom:emits TransferSingle
    function debugMintItem(address to, uint256 tokenPool) external {}

    /// @notice Mint multiple copies of a item from a given pool and deliver them to a target address.
    /// @dev Caller must have `debugger` or `admin` role
    /// @param to The address to receive the item
    /// @param tokenPool The ID of the pool
    /// @param amount The number of items to mint
    /// @custom:emits TransferSingle
    function debugMintItems(
        address to,
        uint256 tokenPool,
        uint256 amount
    ) external {}

    /// @notice Mint one item from multiple pools and deliver them to a target address.
    /// @dev Caller must have `debugger` or `admin` role
    /// @param to The address to receive the item
    /// @param tokenPools The IDs of the pools (ex: [1, 2, 3])
    /// @custom:emits TransferSingle
    function debugMintMultipleItem(
        address to,
        uint256[] memory tokenPools
    ) external {}

    /// @notice Mint multiple items from multiple pools and deliver them to a target address.
    /// @dev Caller must have `debugger` or `admin` role
    /// @param to The address to receive the items
    /// @param tokenPools The IDs of the pools (ex: [1, 2, 3])
    /// @param amounts The number of items to mint for each pool (ex: [10, 10, 10])
    /// @custom:emits TransferSingle
    function debugMintMultipleItems(
        address to,
        uint256[] memory tokenPools,
        uint256[] memory amounts
    ) external {}
}
