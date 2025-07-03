# AlpyToken

[![Foundry](https://img.shields.io/badge/forged%20with-foundry-blue?style=flat-square&logo=forge)](https://book.getfoundry.sh/)
[![License: MIT](https://img.shields.io/badge/license-MIT-yellow?style=flat-square)](LICENSE)

AlpyToken is a basic ERC20 token contract built using OpenZeppelin and Foundry. It is designed to serve as a foundational token for other smart contract applications, including staking systems, DeFi protocols, and learning projects. This repository contains the token implementation, deployment script, and a complete test suite using Foundry.

## Getting Started

To work with this repo, install Foundry if you haven’t already:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

Clone the repo and run tests:

```bash
git clone https://github.com/Alpy16/alpy-token.git
cd alpy-token
forge install
forge test -vvvv
```

## What’s Included

- `src/AlpyToken.sol`  
  A minimal ERC20 contract using OpenZeppelin’s implementation. Sets the name, symbol, and initial supply in the constructor.

- `script/DeployToken.s.sol`  
  A broadcast-ready deployment script for the token using Foundry’s scripting environment.

- `test/AlpyTokenTest.t.sol`  
  A full test suite covering:
  - Initial balances
  - ERC20 `approve`/`transferFrom` flow
  - Overwriting allowance
  - Reverts on missing or insufficient allowance

## Token Details

- Name: AlpyToken  
- Symbol: AT  
- Decimals: 18  
- Initial Supply: 1000 AT (configurable)

## Intended Use

This token is designed to be imported and reused in other smart contract repos as a base ERC20 token. It is ideal for testing staking contracts, DeFi flows, and building familiarity with the ERC20 standard in a clean, test-driven environment.

## License

This project is licensed under the MIT License.

```
MIT License

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
