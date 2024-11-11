// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Domino.sol";

contract DominoImpl is Domino {
    event Destruct(string message);

    address public next;

    function initialize(address _next) public {
        next = _next;
    }

    function topple(address prev) public {
        if (next != address(0)) Domino(next).topple(address(this));
        emit Destruct("Social Welfare");
        selfdestruct(payable(prev));
    }

    receive() external payable {}
}
