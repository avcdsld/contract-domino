// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DominoImpl.sol";

contract DominoFactory2 {
    address[] public dominoes;

    constructor(address[] memory _dominoes) {
        dominoes = _dominoes;
    }

    function play(uint256 n) payable public {
        address domino = address(0);
        for (uint256 i = 0; i < n; i++) {
            address newOne = deploy_(dominoes[i % dominoes.length]);
            // address newOne = deploy();
            (bool success,) = newOne.call(abi.encodeWithSignature("initialize(address)", domino));
            require(success);
            domino = newOne;
            if (i == 0) payable(domino).transfer(msg.value);
        }
        (bool toppleSuccess, ) = domino.call(abi.encodeWithSignature("topple(address)", msg.sender));
        require(toppleSuccess);
    }

    function deploy() internal returns (address) {
        return address(new DominoImpl());
    }

    function deploy_(address _domino) internal returns (address proxy) {
        bytes20 targetBytes = bytes20(_domino);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3)
            mstore(add(clone, 0x14), targetBytes)
            mstore(add(clone, 0x28), 0x5af43d82803e903d91602b57fd5bf3)
            proxy := create(0, clone, 0x37)
        }
    }
}
