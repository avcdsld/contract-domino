// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Domino.sol";
import "./SocialWelfare.sol";
import "./FoodSupply.sol";

contract DominoFactory {
    function play(uint256 n) payable public {
        address domino = address(0);
        for (uint256 i = 0; i < n; i++) {
            address newOne = deploy(i);
            (bool success,) = newOne.call(abi.encodeWithSignature("initialize(address)", domino));
            require(success);
            domino = newOne;
            if (i == 0) payable(domino).transfer(msg.value);
        }
        (bool toppleSuccess, ) = domino.call(abi.encodeWithSignature("topple(address)", msg.sender));
        require(toppleSuccess);
    }

    function deploy(uint256 i) internal returns (address) {
        if (i % 2 == 0) {
            return address (new SocialWelfare());
        }
        return address(new FoodSupply());
    }
}
