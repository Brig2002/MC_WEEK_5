// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./SimpleStorage.sol";  // Import the SimpleStorage contract

contract AdvancedStorage is SimpleStorage {
    uint256 public timestamp;

    // Override the storeNumber function to save a timestamp
    function storeNumber(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber;
        timestamp = block.timestamp;
    }

    // Retrieve both the stored number and the timestamp
    function getWithTimestamp() public view returns (uint256, uint256) {
        return (favoriteNumber, timestamp);
    }
}

contract A {
    function greet() public pure virtual returns (string memory) {
        return "Hello from A";
    }
}

contract B {
    function greet() public pure virtual returns (string memory) {
        return "Hello from B";
    }
}

contract C is A, B {
    // Override to resolve the conflict between A and B
    function greet() public pure override(A, B) returns (string memory) {
        return string(abi.encodePacked(A.greet(), " and ", B.greet()));
    }
}