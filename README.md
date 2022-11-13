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
- [ Images ](#Images)
- [ Coming soon ](#Coming-soon)
- [ Inspiration ](#Inspiration)

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

MVVM with some adds:
- Assemble
- Navigator
- Repository

## Funcionality

Launchscreen for an initial data load. (Not implemented right now)

Tab Bar with: 
- Master detail with Breaking Bad Characters
- Master detail of main crypto exchanges


## Code coverage

Right now, 60,2% and rising

## Unit test

Total: 185

## Authentication

Authentication verifies that the provided user token is correct and, therefore, it can initiate the app. But right now is not needed.

## Images

| **BrBa - Master** | **BrBa - Detail** | **Exchange - Master** | **Exchange - Detail** |
|-----------|-----------|---------|------------|
| ![BrBa - Master](/README_FILES/assets/breakingBadMaster.png)    | ![BrBa - Detail](/README_FILES/assets/breakingBadDetail.png)       | ![Exchange - Master](/README_FILES/assets/master.png)    | ![Exchange - Detail](/README_FILES/assets/detail.png)       | 

## Coming soon

- Move to SwiftUI
- Use of Combine
- Change architecture to MVVM
- Use Charts: https://developer.apple.com/documentation/Charts
- New Coins features
- improvement of connection handler
- ...

## Inspiration

Inspiration [here](/README_FILES/README_2.md)
