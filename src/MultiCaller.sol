// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { console} from "forge-std/console.sol";


contract MultiCall {
    struct Call {
        address targetAddress;
        bytes  callData;
    }

    constructor() {
    }

    function multicall(Call[] memory calls) public {
        for(uint256 i = 0; i < calls.length; i++) {
            (bool success, ) = calls[i].targetAddress.call(calls[i].callData);
            require(success, "call item failed");
        }
    }
}


contract MultiCaller {
    MultiCall public multiCall;

    constructor(address _multiCall){
        multiCall = MultiCall(_multiCall);
    }

    function setNumbers(address target, uint256 number, address targetOne, uint256 numberOne) public {
        console.log("target==", target);
        console.log("data==", number);
        console.log("targetOne==", targetOne);
        console.log("dataOne==", numberOne);

        MultiCall.Call[] memory calls = new MultiCall.Call[](2);

        calls[0] = MultiCall.Call({
            targetAddress: target,
            callData: abi.encodeWithSignature("setNumber(uint256)", number)
        });

        calls[1] = MultiCall.Call({
            targetAddress: targetOne,
            callData: abi.encodeWithSignature("setNumber(uint256)", numberOne)
        });
        multiCall.multicall(calls);
    }
}
