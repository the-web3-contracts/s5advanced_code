// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract StaticCaller {
    function readNumber(address target) public view returns (uint256) {
        bytes memory data = abi.encodeWithSignature("number()");
        (bool success, bytes memory result) = target.staticcall(data);
        require(success, "Staticcall failed");
        return abi.decode(result, (uint256));
    }
}
