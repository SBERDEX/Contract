// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

library Tick {
    struct Info {
        bool initialized;
        uint128 liqidity;
    }

    function update(
        mapping(int24 => Tick.Info) storage self,
        int24 tick,
        uint128 liqidityDelta
    ) internal {
        Tick.Info storage tickInfo = self[tick];
        uint128 liquidityBefore = tickInfo.liqudity;
        uint128 liquidityAfter = liquidityBefore + liqidityDelta;

        if (liquidityBefore == 0) {
            tickInfo.initialized = true;
        }

        tickInfo.liqidity = liquidityAfter;
    }
}
