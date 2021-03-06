// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Auth
/// @notice Provides access control modifiers
abstract contract Auth {
    /// @notice Auth
    mapping(address => uint256) public wards;

    constructor() {
        wards[msg.sender] = 1;
        emit AuthorizedUser(msg.sender);
    }

    /// @notice Authorizes a user
    function rely(address usr) external auth {
        wards[usr] = 1;
        emit AuthorizedUser(usr);
    }

    /// @notice Deauthorizes a user
    function deny(address usr) external auth {
        wards[usr] = 0;
        emit DeauthorizedUser(usr);
    }

    event AuthorizedUser(address indexed usr);
    event DeauthorizedUser(address indexed usr);

    /// @notice - Authorization modifier
    modifier auth() {
        require(wards[msg.sender] == 1, "Adapter/not-authorized");
        _;
    }
}
