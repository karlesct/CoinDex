# CoinDex

**Table of contents**
-----------------------
- [ Requirements ](#Requirements)
- [ Installation ](#Installation)
- [ Access permissions ](#Access-permissions)
- [ Authentication ](#Authentication)
- [ Architecture ](#Architecture)
- [ Funcionality ](#Funcionality)
- [ Code coverage ](#Code-coverage)
- [ Unit tests ](#Unit-test)
- [ Coming soon ](#Coming-soon)

## Requirements

**Please make sure you are using the last Xcode**

| **Swift** | **Xcode** | **iOS** | **Status** |
|-----------|-----------|---------|------------|
| 5.5       | 13+       | 14.0+   | Supported  |

## Installation

The main objective in the development of the CoinDex project is to carry out all the development without any type of framework. For this reason, it is not necessary to use any package manager like Cocoapods or Swift Package Manager (SPM).

## Access permissions

Right now, no permissions needed

## Architecture

MVP with some adds:
- Assemble
- Navigator
- Repository

## Funcionality

Launchscreen for an initial data load. (Not implemented right now)

Tab Bar with: 
- Master detail of main crypto exchanges
- Welcome with some motivating phrases

## Code coverage

Right now, 60,1% and rising

## Unit test

Total: 193

## Authentication

Authentication verifies that the provided user token is correct and, therefore, it can initiate the app. But right now is not needed.

## Coming soon

- Move to SwiftUI
- Use of Combine
- Change architecture to MVVM
- Use Charts: https://developer.apple.com/documentation/Charts
- New Coins features
- improvement of connection handler
- ...

