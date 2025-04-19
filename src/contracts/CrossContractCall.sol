// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


import { console} from "forge-std/console.sol";


import "../interface/ICrossContractCall.sol";

contract CrossContractCall is ICrossContractCall {
    uint256 public result;

    constructor() {
        result = 0;
    }

    function addTwo(uint256 valueOne, uint256 valueTwo) external returns (uint256) {
        console.log("=====addTwo address(this)========");
        console.log(address(this));
        console.log("======addTwo address(this)=======");
        console.log("======addTwo msg.sender=======");
        console.log(msg.sender);
        console.log("======addTwo msg.sender=======");
        console.log("======addTwo tx.origin=======");
        console.log(tx.origin);
        console.log("======addTwo tx.origin=======");
        result = valueOne + valueTwo;
        return result;
    }

    function addThree(uint256 valueOne, uint256 valueTwo, uint256 valueThree) external returns (uint256) {
        result = valueOne + valueTwo + valueThree;
        return result;
    }

}
