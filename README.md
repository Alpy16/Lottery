# Foundry Smart Contract Lottery (Chainlink VRF V2 Plus Edition)

This is a decentralized, verifiably fair lottery system built using Solidity, Foundry, and Chainlink VRF V2 Plus. Participants enter by paying an ETH fee, and after a set time interval, a random winner is chosen using Chainlink's verifiable randomness.

## What This Is

A complete, test-driven smart contract lottery project compatible with Chainlink VRF V2 Plus, including:
- Local + staging testing
- Custom error handling
- Fully automated upkeep logic
- Chainlink mock support for local development

## Why I Migrated to Chainlink VRF V2 Plus

The original Cyfrin Updraft project used Chainlink VRF V2, which is now deprecated. I upgraded this project to VRF V2 Plus for:
- Better network availability and reliability
- Support for native token payment (optional)
- Newer, struct-based API format for randomness requests
- Long-term compatibility with Chainlink tooling

To reflect those improvements, I updated the codebase to use:
- `VRFConsumerBaseV2Plus` as the base contract
- `VRFCoordinatorV2PlusMock` for local tests
- `VRFV2PlusClient` to build request parameters

## Project Structure

foundry-smart-contract-lottery-f23/  
├── src/  
│   └── Raffle.sol  
├── script/  
│   ├── DeployRaffle.s.sol  
│   └── HelperConfig.s.sol  
├── test/  
│   ├── unit/  
│   │   └── RaffleTest.t.sol  
│   └── staging/  
│       └── RaffleStagingTest.t.sol  
├── lib/  
├── foundry.toml  
└── README.md

## Key Changes I Made

| Area              | Update                                                                  |
|-------------------|--------------------------------------------------------------------------|
| Chainlink Version | Migrated from VRF V2 to VRF V2 Plus                                      |
| Mocks             | Replaced with `VRFCoordinatorV2PlusMock`                                 |
| Consumer Contract | Uses `VRFConsumerBaseV2Plus` and `VRFV2PlusClient`                       |
| Randomness Call   | Switched to struct-based `requestRandomWords()` with `extraArgs`         |
| Errors            | Refactored to `Raffle__ErrorName()` style for clearer debugging          |
| Events            | Indexed `requestId` for improved log inspection                          |
| Tests             | Adjusted to new randomness pipeline and local VRF mocking behavior       |

## Chainlink Automation Support

This project includes full Chainlink Automation (Keepers) compatibility:

- `checkUpkeep()` checks if the raffle should run (time passed, players exist, contract funded)
- `performUpkeep()` requests randomness and transitions state from OPEN → CALCULATING

## How to Run the Tests

```bash
forge install
forge build
forge test
```

You should see all 16 tests passing.

### Test Files

- `test/unit/RaffleTest.t.sol` — core unit testing with mocks
- `test/staging/RaffleStagingTest.t.sol` — staging tests verifying full random winner logic

## Prerequisites

- Foundry (`foundryup`)
- Chainlink contracts (installed via `forge install` or as submodule)
- Optional: `.env` and RPC setup if deploying to real networks

## Credits

- Based on the Cyfrin Updraft Course by PatrickAlphaC
- Upgraded and maintained to support Chainlink’s VRF V2 Plus by me
# foundry-smart-contract-lottery-f23
