// SPDX-License-Identifier: WTFPL
pragma solidity ^0.8.0;

contract Domino {
    address public next;

    function place(address _next) public {
        next = _next;
    }

    function topple() public {
        if (next != address(0)) {
            Domino(payable(next)).topple();
        }
        selfdestruct(payable(msg.sender));
    }

    receive() external payable {} 
}
