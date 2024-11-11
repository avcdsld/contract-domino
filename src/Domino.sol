// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Domino {
    function initialize(address _next) external;
    function topple(address _prev) external;
}
