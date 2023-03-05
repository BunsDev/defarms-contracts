// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;

import { console } from "forge-std/console.sol";
import { stdStorage, StdStorage, Test } from "forge-std/Test.sol";
import { Utilities } from "../utils/Utilities.sol";

import "src/Manifestation.sol";
import "src/Manifester.sol";
import "src/mocks/MockToken.sol";
import "src/mocks/MockPair.sol";
import "src/mocks/MockFactory.sol";

contract Setup is Test {
    Manifester manifester;
    Manifestation manifestation;
    MockToken rewardToken;
    MockToken wnativeToken;
    MockToken usdcToken;
    MockToken depositToken;
    MockPair nativePair;
    MockPair stablePair;

    MockFactory public factory;
    Utilities internal utils;

    // addresses //
    address public FACTORY_ADDRESS;
    address public REWARD_ADDRESS;
    address public DEPOSIT_ADDRESS;
    address public WNATIVE_ADDRESS;
    address public USDC_ADDRESS;
    address public MANIFESTER_ADDRESS;
    address public NATIVE_PAIR_ADDRESS;
    address public STABLE_PAIR_ADDRESS;
    address public MANIFESTATION_0_ADDRESS;

    // numeric constants //
    uint public immutable ORACLE_DECIMALS = 8;
    uint public immutable DURA_DAYS = 90;
    uint public immutable FEE_DAYS = 14;
    uint public immutable DAILY_REWARD = 100;
    uint public immutable INITIAL_SUPPLY = 1_000_000_000;
    uint public immutable ONE_DAY = 1 days;

    // admins //
    address payable[] internal admins;
    address internal SOUL_DAO_ADDRESS; // = msg.sender;
    address internal DAO_ADDRESS = msg.sender;
    address internal CREATOR_ADDRESS = address(this); // 0xFd63Bf84471Bc55DD9A83fdFA293CCBD27e1F4C8

    // addresses //
    address NATIVE_ORACLE_ADDRESS = 0xf4766552D15AE4d256Ad41B6cf2933482B0680dc; // FTM [250]

    // initializes tokens, pairs
    constructor() {

        // initializes: Mock Factory
        factory = new MockFactory();
        FACTORY_ADDRESS = address(factory);

        // initializes: Native Token
        wnativeToken = new MockToken(
            "Wrapped Fantom",
            "WFTM",
            INITIAL_SUPPLY                     // totalSupply
        );
        WNATIVE_ADDRESS = address(wnativeToken);

        // initializes: USDC Token
        usdcToken = new MockToken(
            "USD Coin",
            "USDC",
            INITIAL_SUPPLY                     // totalSupply
        );
        USDC_ADDRESS = address(usdcToken);

        // initializes: Reward Token
        rewardToken = new MockToken(
            "RewardToken",
            "REWARD",
            INITIAL_SUPPLY                     // totalSupply
        );
        REWARD_ADDRESS = address(rewardToken);

        nativePair = new MockPair(
            FACTORY_ADDRESS,                  // factoryAddress
            address(rewardToken),             // token0Address
            address(wnativeToken),            // token1Address
            address(wnativeToken),            // wnativeAddress
            INITIAL_SUPPLY                    // totalSupply
        );
        NATIVE_PAIR_ADDRESS = address(nativePair);
        DEPOSIT_ADDRESS = address(nativePair); 

        stablePair = new MockPair(
            FACTORY_ADDRESS,                  // factoryAddress
            address(rewardToken),             // token0Address
            address(usdcToken),               // token1Address
            address(wnativeToken),            // wnativeAddress
            INITIAL_SUPPLY                    // totalSupply
        );
        STABLE_PAIR_ADDRESS = address(stablePair);

        // deploys: Manifester Contract
        manifester = new Manifester(
            FACTORY_ADDRESS,
            USDC_ADDRESS,
            WNATIVE_ADDRESS,
            NATIVE_ORACLE_ADDRESS,
            ORACLE_DECIMALS,
            wnativeToken.symbol()
        );
        MANIFESTER_ADDRESS = address(manifester);

        // creates: Manifestation[0]
        manifester.createManifestation(
            DEPOSIT_ADDRESS,      // address depositAddress,
            REWARD_ADDRESS,       // address rewardAddress, 
            0,                    // address rewardAddress, 
            true                  // bool isNative
        );

        MANIFESTATION_0_ADDRESS = manifester.manifestations(0);
        manifestation = Manifestation(MANIFESTATION_0_ADDRESS);

        // initializes: Manifestation[0]
        manifester.initializeManifestation(0);

    }
}