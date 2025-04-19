// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 public data;


    constructor(uint256 _data) {
        data = _data;
    }
}
