// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {LibTerminus} from "../../lib/web3/contracts/terminus/LibTerminus.sol";
import {TerminusFacet} from "../../lib/web3/contracts/terminus/TerminusFacet.sol";
import {LibContractOwner} from "../../lib/cu-osc-diamond-template/src/libraries/LibContractOwner.sol";

/// @title LG Terminus Initializer
/// @dev This handles the behavior covered by TerminusInitializer, without using diamond `init`.
contract LGTerminusFacet is TerminusFacet {
    /// @notice This function sets the controller of LibTerminus
    /// @dev Only the contract owner can call this function
    function initializeTerminusDiamond() external {
        LibContractOwner.enforceIsContractOwner();
        LibTerminus.terminusStorage().controller = LibContractOwner
            .contractOwner();
    }

    /// @notice Create a new token pool
    /// @dev Only the controller can call this function
    /// @param capacity The maximum number of tokens that can be minted
    /// @param transferable Whether the tokens can be transferred
    /// @param burnable Whether the tokens can be burned
    /// @param poolURI The URI of the pool
    /// @return poolId The ID of the new pool
    function createPool(
        uint256 capacity,
        bool transferable,
        bool burnable,
        string calldata poolURI
    ) external returns (uint256 poolId) {
        LibContractOwner.enforceIsContractOwner();
        LibTerminus.enforceIsController();
        LibTerminus.TerminusStorage storage ts = LibTerminus.terminusStorage();
        poolId = LibTerminus.createSimplePool(capacity);
        ts.poolNotTransferable[poolId] = !transferable;
        ts.poolBurnable[poolId] = burnable;
        ts.poolURI[poolId] = poolURI;
    }
}
