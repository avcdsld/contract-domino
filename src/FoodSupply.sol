// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Domino.sol";

contract FoodSupply is Domino {
    event Destruct(string message);

    string public constant contractName = "Food Supply";

    address public next;

    function initialize(address _next) public {
        require(next == address(0));
        next = _next;
    }

    function topple(address prev) public {
        if (next != address(0)) Domino(next).topple(address(this));
        emit Destruct(contractName);
        selfdestruct(payable(prev));
    }

    receive() external payable {}
}
