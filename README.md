# Payless Protocol Core

The decentralized device trust layer on **Base**.

## Table of Contents
* [Overview](#overview)
* [Contract Information](#contract-information)
* [Technical Logic](#technical-logic)
* [Roadmap](#roadmap)

---

## Overview
Payless is an on-chain registry designed to solve the "Trust Gap" in emerging secondary device markets. It allows for immutable tracking of device status (Clean vs. Flagged) using hashed IMEI identification to prioritize user privacy.

---

## Contract Information
| Property | Detail |
| :--- | :--- |
| **Network** | Base Sepolia |
| **Contract Address** | `[0x90afC5fDaD522Bd0a71CE62Cf3b28cA024DCb392]` |
| **Status** | V1 Alpha (Live) |

---

## Technical Logic

* **IMEI Privacy:** Uses `keccak256` hashing to ensure raw IMEI numbers are never stored on-chain.
* **Decentralized Recovery:** Employs a `secretHash` mechanism, allowing device owners to clear flags without a centralized intermediary.
* **Gas Optimized:** Utilizes `uint64` timestamps and custom errors to minimize transaction costs on Base.

---

## Roadmap

* **V2:** Integration of Zero-Knowledge (ZK) Proofs for enhanced metadata privacy and an Admin key.
* **V3:** Composable Escrow module for peer-to-peer transactions.
