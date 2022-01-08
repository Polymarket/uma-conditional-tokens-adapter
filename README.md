# UMA Conditional Tokens Binary Adapter

![Github Actions](https://github.com/Polymarket/uma-conditional-tokens-adapter/workflows/Tests/badge.svg)
![Github Actions](https://github.com/Polymarket/uma-conditional-tokens-adapter/workflows/Lint/badge.svg)

## Overview

This repository contains code used to resolve [Polymarket](https://polymarket.com/) prediction markets via UMA's [optimistic oracle](https://docs.umaproject.org/oracle/optimistic-oracle-interface).


### Architecture

The Adapter is effectively an [oracle](https://github.com/gnosis/conditional-tokens-contracts/blob/master/contracts/ConditionalTokens.sol#L65) to [Conditional Token FPMMs](https://docs.gnosis.io/conditionaltokens/), which Polymarket prediction markets are based on. It fetches resolution data from UMA's Optmistic oracle and resolves the FPMM based on said resolution data. When a new market is deployed, it is `initialized` on the Adapter, meaning market data such as resolution time, question description, etc are stored onchain.

After initialization, anyone can call `requestResolutionData` which queries the Optimistic Oracle for resolution data.

UMA Proposers will then respond to the request and fetch resolution data offchain. If the resolution data is not disputed, the data will be available to the Adapter after a defined liveness period. If the proposal is disputed, the DVM is the fallback and will return data after a 48 - 72 hour period.
     
After resolution data is available, anyone can call `reportPayouts` which resolves the market.

### Deployments

| Network          | Explorer                                                                          |
| ---------------- | --------------------------------------------------------------------------------- |
| Polygon          | https://polygonscan.com/address/0x7336e3e181b0e615dd9cc3e35197593363bd6407        |
| Mumbai           | https://mumbai.polygonscan.com/address/0x7336e3e181b0E615dD9Cc3e35197593363Bd6407 |


### Dependencies

Install dependencies with `yarn install`


### Compile

Compile the contracts with `yarn compile`


### Testing

Test the contracts with `yarn test`

### Coverage

Generate coverage reports with `yarn coverage`
