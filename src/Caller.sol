// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Caller {
    function callSetNumber(address _target, uint256 _number) public {
        (bool success, ) = _target.call(
            abi.encodeWithSignature("setNumber(uint256)", _number)
        );
        require(success, "call setNumber is failed");
    }

    function callIncrement(address _target) public {
        (bool success, ) = _target.call(
            abi.encodeWithSignature("increment()")
        );
        require(success, "call increment is failed");
    }
}
