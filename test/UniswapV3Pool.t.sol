// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "../lib/forge-std/src/Test.sol";
import "./ERC20Mintable.sol";

contract UniswapDexV3PoolTest is Test {
    ERC20Mintable token0;
    ERC20Mintable token1;
    UniswapV3Pool pool;

    function setUp() public {
        token0 = new ERC20Mintable("Ether", "ETH", "18");
        token1 = new ERC20Mintable("USDC", "USDC", "18");
    }

    function testMintSuccess() public {
        TestCaseParams memory params = TestCaseparams({
            wethBalance: 1 ether,
            usdcBalance: 5000 ether,
            currentTick: 85176,
            lowerTick: 84222,
            upperTick: 86129,
            liquidity: 1517882343751509868544,
            currentSqrtP: 5602277097478614198912276234240,
            shouldTransferinCallback: true,
            mintLiquidity: true
        });
    }
}
