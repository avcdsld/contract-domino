// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {DominoFactory} from "../src/DominoFactory.sol";
import {Domino} from "../src/Domino.sol";

contract DominoFactoryTest is Test {
    DominoFactory public factory;

    function setUp() public {
        factory = new DominoFactory();
    }

    function test_Play() public {
        address domino01 = factory.place();
        Domino(payable(domino01)).topple();
        console2.log("success");
    }
}
