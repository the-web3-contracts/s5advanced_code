// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract Factory {
    event Deployed(address addr, uint256 salt);

    function deploy(bytes32 salt, bytes memory bytecode) public returns (address) {
        address addr;
        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }
        require(addr != address(0), "Deploy failed");
        emit Deployed(addr, salt);
        return addr;
    }

    function computeAddress(uint256 _salt, uint256 _data) public view returns (address) {
        bytes memory bytecode = getBytecode(_data);
        bytes32 hash = keccak256(
            abi.encodePacked(bytes1(0xff), address(this), _salt, keccak256(bytecode))
        );
        return address(uint160(uint256(hash)));
    }

    function getBytecode(uint256 _data) public pure returns (bytes memory) {
        bytes memory bytecode = type(SimpleStorage).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_data));
    }
}

