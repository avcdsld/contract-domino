// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {DominoFactory} from "../src/DominoFactory.sol";
import {SocialWelfare} from "../src/SocialWelfare.sol";
import {FoodSupply} from "../src/FoodSupply.sol";

contract DominoFactoryTest is Test {
    DominoFactory public factory;

    function setUp() public {
        factory = new DominoFactory();
    }

    function test_Play() public {
        factory.play{value: 0.001 ether}(10);
        console2.log("success");
    }
}
