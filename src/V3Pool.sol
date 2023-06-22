// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "./lib/Tick.sol";
import "./lib/Position.sol";

contract SberDexV3Pool {
    using Tick for mapping(int24 => Tick.Info);
    using Position for mapping(bytes32 => Position.Info);
    using Position for Position.Info;

    int24 internal constant MIN_TICK = -887272;
    int24 internal constant MAX_TICK = -MIN_TICK;

    //Pool tokens, immutable
    address public immutable token0;
    address public immutable token1;

    //Packing variable that are read together
    struct Slot0 {
        //Current sqrt (P)
        uint160 sqrtPriceX96;
        //Current Tick
        int24 tick;
    }

    Slot0 public slot0;

    //Amount of liqudity, L
    uint128 public liqudity;

    //Ticks info
    mapping(int24 => Tick.Info) public ticks;
    //Position info
    mapping(bytes32 => Position.Info) public position;

    constructor(
        address token0_,
        address token1_,
        uint160 sqrtPriceX96,
        int24 tick
    ) {
        token0 = token0_;
        token1 = token1_;

        slot0 = Slot0({sqrtPriceX96: sqrtPriceX96, tick: tick});
    }
}
