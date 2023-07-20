// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

library Tick {
    struct Info {
        bool initialized;
        uint128 liqudity;
    }

    function update(
        mapping(int24 => Tick.Info) storage self,
        int24 tick,
        uint128 liqudityDelta
    ) internal returns (bool flipped) {
        Tick.Info storage tickInfo = self[tick];
        uint128 liquidityBefore = tickInfo.liqudity;
        uint128 liquidityAfter = liquidityBefore + liqudityDelta;

        flipped = (liquidityAfter == 0) != (liquidityBefore == 0);

        if (liquidityBefore == 0) {
            tickInfo.initialized = true;
        }

        tickInfo.liqudity = liquidityAfter;
    }
}
