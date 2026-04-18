# Payless-Core-Smart-Contract-
​The decentralized device trust layer on Base.
​Overview
​Payless is an on-chain registry designed to solve the "Trust Gap" in emerging secondary device markets. It allows for immutable tracking of device status (Clean vs. Flagged) using hashed IMEI identification to prioritize user privacy.
​Contract Information
​Network: Base Sepolia
​Contract Address: [0xe28e2D07c3E44709Ce0286A4ce44398F2B6aA4C4]
​Status: V1 Alpha (Live)
​Technical Logic
​IMEI Privacy: Uses keccak256 hashing to ensure raw IMEI numbers are never stored on-chain.
​Decentralized Recovery: Employs a secretHash mechanism, allowing device owners to clear flags without a centralized intermediary.
​Gas Optimized: Utilizes uint64 timestamps and custom errors to minimize transaction costs on Base.
​Roadmap
​V2: Integration of Zero-Knowledge (ZK) Proofs for enhanced metadata privacy and an Admin Key.
​V3: Composable Escrow module for peer-to-peer transactions.
