// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from 'forge-std/Test.sol';
import {StdInvariant} from 'forge-std/StdInvariant.sol';
import {DeployDSC}  from "../../script/DeployDSC.s.sol";
import {DSCEngine} from '../../src/DSCEngine.sol';
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
import {HelperConfig} from '../../script/HelperConfig.s.sol';
import {IERC20} from '@openzeppelin/contracts/interfaces/IERC20.sol';
import {Handler} from './Handler.t.sol';


contract Invariants is StdInvariant, Test {
    DeployDSC deployer;
    DecentralizedStableCoin dsc;
    DSCEngine engine;
    HelperConfig helperConfig;
    address weth;
    address wbtc;
    Handler handler;
    
    function setUp() external {
        deployer = new DeployDSC();
        (dsc, engine, helperConfig) = deployer.run();
        (,,weth,wbtc,) = helperConfig.activeNetworkConfig();
        // targetContract(address(engine));
        handler = new Handler(engine, dsc);
        targetContract(address(handler));
    }

    function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
        uint256 totalSupply = dsc.totalSupply();
        uint256 totalWethDeposited = IERC20(weth).balanceOf(address(engine));
        uint256 totalBtcDeposited = IERC20(wbtc).balanceOf(address(engine));
        uint256 wethValue = engine.getUsdValue(weth, totalWethDeposited);
        uint256 wbtcValue = engine.getUsdValue(wbtc, totalBtcDeposited);
        assert(wethValue+wbtcValue >= totalSupply);
    }

    

}