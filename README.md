# LibraryTracker Smart Contract (CTA Activity - 4)

A Solidity-based decentralized library inventory and borrowing tracker deployed on a local Ethereum blockchain (**Ganache**) using **Remix IDE** and **MetaMask**.

## Overview
`LibraryTracker` maintains a tamper-proof on-chain catalog of library books, enforces librarian-only book registration, prevents duplicate book IDs, and logs borrowing events with wallet accountability.

## Key Features
* **Librarian Access Control (`librarian`):** Stores the deployer's address (`msg.sender`) in the `constructor` and restricts adding new books strictly to that address using `require`.
* **Book Struct & Mapping (`struct` & `mapping`):** Maps each unique book ID (`string`) to a `Book` record containing `title`, `author`, and `isAvailable`.
* **Duplicate & Availability Guards (`require`):** Prevents registering duplicate book IDs and blocks borrowing a book that is already checked out.
* **Event Logging (`BookAdded`, `BookBorrowed`):** Emits indexed blockchain events whenever a book is added or borrowed.
* **Gas-Free Lookup (`checkBook`):** A `view` function returning book details and real-time availability without spending gas.

## Tech Stack & Environment
* **Language:** Solidity (`^0.8.20`, compiled with EVM target `paris`)
* **IDE:** Remix IDE
* **Local Blockchain:** Ganache (`http://127.0.0.1:7545`, Chain ID: `1337`)
* **Wallet Provider:** MetaMask (Injected Provider)

## Deployment & Execution Flow
1. Connected **Remix IDE** to a local **Ganache** Ethereum node via **MetaMask** (`Browser Extension`).
2. Compiled `LibraryTracker.sol` targeting the `paris` EVM version and deployed the contract (`0xd7D...F2962`).
3. Registered a book (`"isbn123"`, `"blockchain"`, `"sanjana"`) via `addBook()` and updated its status using `borrowBook("isbn123")` (`block:10`).
4. Verified the updated state (`isAvailable: false`) via `checkBook("isbn123")`.

## Repository Contents
* `LibraryTracker.sol` — Solidity smart contract source code
* Screenshots of Remix IDE execution logs and Ganache mined blocks
