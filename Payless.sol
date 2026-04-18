// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

/**
 * @title Payless Device Registry
 * @dev A registry for tracking device status (CLEAN, TIER1, TIER2) using IMEI hashes.
 */
contract Payless {

    enum Status {
        CLEAN,
        TIER1,
        TIER2
    }

    struct DeviceRecord {
        bytes32 secretHash;
        uint64 updateAt;
        Status status;
    }

    // imeiHash => DeviceRecord
    mapping (bytes32 => DeviceRecord) public registry;

    // Custom Errors for Gas Efficiency
    error AlreadyUnflagged();
    error InvalidImei();
    error InvalidSecret();
    error Unauthorized();

    // Events
    event Tier1(bytes32 indexed imeiHash, bytes32 secretHash);
    event UnflagTier1(bytes32 indexed imeiHash, bytes32 secretHash);

    /**
     * @notice Flags a device as TIER1 (e.g., locked or under credit).
     * @param imeiHash The keccak256 hash of the device IMEI.
     * @param secretHash The hash used as a password to unlock the record later.
     */
    function flagDevice(bytes32 imeiHash, bytes32 secretHash) external {
        if (imeiHash == bytes32(0)) revert InvalidImei();
        if (secretHash == bytes32(0)) revert InvalidSecret();

        DeviceRecord storage device = registry[imeiHash];

        // Only set the secret if it hasn't been set before
        if (device.secretHash == bytes32(0)) {
            device.secretHash = secretHash;
        }

        device.status = Status.TIER1;
        device.updateAt = uint64(block.timestamp);

        emit Tier1(imeiHash, secretHash);
    }

    /**
     * @notice Removes the flag from a device, returning it to CLEAN status.
     * @param imeiHash The keccak256 hash of the device IMEI.
     * @param secretHash Must match the hash provided during the flagging process.
     */
    function unflagDevice(bytes32 imeiHash, bytes32 secretHash) external {
        if (imeiHash == bytes32(0)) revert InvalidImei();

        DeviceRecord storage device = registry[imeiHash];

        // SECURITY CHECK: Verify the secret matches the record
        if (device.secretHash != secretHash) revert InvalidSecret();
        
        // Ensure we aren't unflagging something already clean
        if (device.status == Status.CLEAN) revert AlreadyUnflagged();

        device.status = Status.CLEAN;
        device.updateAt = uint64(block.timestamp);

        emit UnflagTier1(imeiHash, secretHash);
    }
}