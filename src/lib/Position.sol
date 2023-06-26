// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

library Position {
    struct Info {
        uint128 liqidity;
    }

    function update(Info storage self, uint128 liquidityDelta) internal {
        uint128 liquidityBefore = self.liqidity;
        uint128 liquidityAfter = liquidityBefore + liquidityDelta;

        self.liqidity = liquidityAfter;
    }
}
