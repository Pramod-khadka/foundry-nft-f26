# 🖼️ Foundry NFT Project

A smart contract project built with Foundry that implements both a standard ERC721 NFT and a dynamic Mood NFT with fully on-chain metadata. This project demonstrates practical experience in designing, testing, and deploying decentralized applications using Solidity and modern Ethereum development tools.

---

## 📌 Overview

This repository showcases two NFT implementations:

* **Basic NFT**
  A minimal ERC721 token that supports minting and standard NFT functionality.

* **Mood NFT (Dynamic NFT)**
  An advanced NFT that changes its visual representation and metadata between *happy* and *sad* states based on on-chain interactions.

The Mood NFT highlights how NFTs can evolve dynamically using smart contract logic, without relying on off-chain services.

---

## ⚙️ Key Features

* ERC721-compliant NFT implementation
* Dynamic NFTs with state-dependent metadata
* Fully on-chain SVG image storage
* Unit and integration testing using Foundry
* Automated deployment scripts
* Clean and modular smart contract architecture

---

## 🏗️ Project Structure

```bash
src/        # Smart contracts  
script/     # Deployment scripts  
test/       # Unit and integration tests  
lib/        # Dependencies (OpenZeppelin, forge-std)  
```

---

## 🎨 Example NFTs

### Happy Mood

![Happy NFT](img/happy.svg)

### Sad Mood

![Sad NFT](img/sad.svg)

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone --recurse-submodules https://github.com/Pramod-khadka/foundry-nft-f26.git
cd foundry-nft-f26
```

### 2. Install dependencies

```bash
forge install
```

### 3. Build contracts

```bash
forge build
```

### 4. Run tests

```bash
forge test
```

---

## 🚀 Deployment

Create a `.env` file in the root directory:

```bash
PRIVATE_KEY=
SEPOLIA_RPC_URL=
```

Deploy the contract:

```bash
forge script script/DeployMoodNft.s.sol \
--rpc-url $SEPOLIA_RPC_URL \
--private-key $PRIVATE_KEY \
--broadcast
```

---

## 🧠 Learning Outcomes

Through this project, I developed:

* Strong understanding of ERC721 NFT standards
* Experience building dynamic NFTs with on-chain logic
* Knowledge of handling on-chain metadata and SVG images
* Skills in writing and structuring smart contract tests
* Hands-on experience with Foundry development workflow

---

## 🛠️ Tech Stack

* **Solidity**
* **Foundry (Forge, Cast, Anvil)**
* **OpenZeppelin Contracts**

---

## 🔐 Security Considerations

* Private keys are managed via `.env` and are not committed
* Contracts use OpenZeppelin standards for reliability
* Tested using unit and integration tests

---

## 👤 Author

**Pramod Khadka**

---

## ⭐ Future Improvements

* Deploy and verify contracts on Sepolia / Etherscan
* Add frontend interface for NFT interaction
* Expand NFT functionality (metadata, traits, marketplace integration)
