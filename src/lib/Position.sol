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

    function get(
        mapping(bytes32 => Info) storage self,
        address owner,
        int24 lowerTick,
        int24 upperTick
    ) internal view returns (Position.Info storage position) {
        position = self[
            keccak256(abi.encodePacked(owner, lowerTick, upperTick))
        ];
    }
}
