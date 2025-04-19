// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { console} from "forge-std/console.sol";

import "../interface/ICrossContractCallOne.sol";
import "../interface/ICrossContractCall.sol";

contract CrossContractCallOne is ICrossContractCallOne {
    ICrossContractCall public ccCall;

    constructor(ICrossContractCall _ccCall){
        ccCall = _ccCall;
    }

    function addResult() external  returns (uint256) {
        console.log("=====addResult address(this)========");
        console.log(address(this));
        console.log("======addResult address(this)=======");
        console.log("======addResult msg.sender=======");
        console.log(msg.sender);
        console.log("======addResult msg.sender=======");
        console.log("======addResult tx.origin=======");
        console.log(tx.origin);
        console.log("======addResult tx.origin=======");
        return ccCall.addTwo(100, 200);
    }

    function addThree() external returns (uint256) {
        return ccCall.addThree(100, 200, 1000);
    }
}
