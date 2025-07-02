# Alpy Raffle — Smart Contract Lottery with Chainlink VRF V2 Plus

[![Forged with Foundry](https://img.shields.io/badge/forged%20with-foundry-blue.svg?style=flat-square&logo=foundry)](https://book.getfoundry.sh/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

A decentralized smart contract lottery using Chainlink VRF v2+ and Chainlink Automation, built and tested with Foundry.

---

## Quick Start

### 1. Clone and Install

```bash
git clone https://github.com/Alpy16/foundry-smart-contract-lottery-f23.git
cd foundry-smart-contract-lottery-f23
forge install
```

### 2. Build Contracts

```bash
forge build
```

### 3. Run Tests

```bash
forge test
```

### 4. Deploy Locally (Anvil)

```bash
anvil
```

In a separate terminal:

```bash
forge script script/DeployRaffle.s.sol --rpc-url http://localhost:8545 --broadcast -vvvv
```

---

## Project Structure

```
foundry-smart-contract-lottery-f23/
├── src/                # Raffle.sol contract
├── script/             # Deploy & helper scripts
├── test/               # Unit & staging tests
├── lib/                # Dependencies
├── foundry.toml        # Project config
└── README.md
```

---

## What I Changed and Why

This project is a fork of the original Cyfrin Updraft Lottery using Foundry, but adapted to work with Chainlink VRF V2 Plus. I made the following key updates:

- Migrated from `VRFCoordinatorV2Mock` to `VRFCoordinatorV2PlusMock` for compatibility with Chainlink’s newer randomness infrastructure.
- Refactored the consumer contract to inherit from `VRFConsumerBaseV2Plus` and use the newer `requestRandomWords` API structure with `extraArgs`.
- Updated the error names in the Raffle contract to follow the `Raffle__ErrorName()` pattern, which improves readability and test traceability.
- Removed `console.log` and `console2.log` statements to clean up test output and reduce unnecessary gas usage.
- Adjusted the test cases and log expectations to reflect how VRF V2 Plus structures request IDs and responses differently than V2.

---

## Key Changes in This Fork

| Area              | Update                                                                 |
|-------------------|------------------------------------------------------------------------|
| Chainlink Version | I migrated from VRF v2 to VRF v2 Plus                                   |
| Mocks             | I replaced the old mock with `VRFCoordinatorV2PlusMock`                 |
| Consumer Contract | I updated to use `VRFConsumerBaseV2Plus` and `VRFV2PlusClient`         |
| Randomness Call   | I switched to struct-based `requestRandomWords()` with `extraArgs`     |
| Errors            | I renamed them to `Raffle__ErrorName()` for clearer traceability       |
| Events            | I indexed the `requestId` for better test access and filtering         |
| Tests             | I refactored tests to match the updated VRF pipeline and log structure |

---

## Environment Setup

Create a `.env` file:

```dotenv
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/your-api-key
PRIVATE_KEY=your-private-key
ETHERSCAN_API_KEY=your-etherscan-key
```

Access these in scripts with Foundry’s `vm.envString()`.

---

## Test Commands

- Unit Tests: `forge test`
- Staging (VRF) Tests: `forge test --match-path test/staging/*`
- Fork Testing: Add a `FOUNDRY_PROFILE=fork` and configure it in `foundry.toml`

---

## Resources

- [Foundry Book](https://book.getfoundry.sh/)
- [Chainlink VRF v2 Plus](https://docs.chain.link/vrf/v2-5/)
- [Cyfrin Foundry Course](https://github.com/Cyfrin/foundry-full-course-f23)

---

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
