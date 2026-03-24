## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

🖼️ Foundry NFT Project

A smart contract project built with Foundry that implements two types of NFTs:

Basic ERC721 NFT – a standard mintable token
Dynamic Mood NFT – an NFT that changes between happy and sad states

This project demonstrates key Web3 concepts such as on-chain metadata, SVG-based NFTs, and smart contract testing.

⚙️ How It Works
Basic NFT
Implements the ERC721 standard
Allows users to mint NFTs
Mood NFT
Stores two SVG images (happy & sad)
Updates metadata dynamically based on mood
Allows users to flip mood directly on-chain
🎨 Example NFTs
Happy Mood




Sad Mood




🚀 Quick Start
Clone the repository
git clone --recurse-submodules https://github.com/Pramod-khadka/foundry-nft-f26.git
cd foundry-nft-f26
Build
forge build
Test
forge test
🚀 Deploy

Create a .env file in the root directory:

PRIVATE_KEY=
SEPOLIA_RPC_URL=

Run the deployment script:

forge script script/DeployMoodNft.s.sol \
--rpc-url $SEPOLIA_RPC_URL \
--private-key $PRIVATE_KEY \
--broadcast
🎯 Purpose

This project was built to:

Learn the Foundry development workflow
Understand ERC721 NFT standards
Explore dynamic NFTs with on-chain metadata
Practice writing and testing smart contracts
