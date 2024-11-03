# Crowdfunding Smart Contract in Vyper

## Overview
This project implements a decentralized crowdfunding platform using **Vyper**. It allows users to:
1. **Contribute ETH** towards a campaign.
2. **Withdraw funds** if the goal is reached by the campaign owner.
3. **Get refunds** if the goal is not met by the deadline.

The smart contract was deployed and tested on the **Sepolia Testnet** using **MetaMask** and **Remix IDE**.

---

## Technologies Used
- **Vyper**: Smart contract language with simplicity and security.
- **Remix IDE**: Web-based IDE for developing and deploying smart contracts.
- **MetaMask**: Wallet for managing accounts and transactions.
- **Sepolia Testnet**: Ethereum testnet used for deployment and testing.

---

## Setup Instructions

### Prerequisites
1. **Install MetaMask**:
   - Download the browser extension from [MetaMask.io](https://metamask.io).
   - Create or import a wallet.

2. **Add Sepolia Testnet to MetaMask**:
   - Open MetaMask and go to **Settings > Networks > Add Network**.
   - Use the following details:
     - **RPC URL**: `https://rpc.sepolia.org`
     - **Chain ID**: `11155111`
     - **Currency Symbol**: ETH
     - **Block Explorer URL**: `https://sepolia.etherscan.io`

3. **Get Sepolia Test ETH**:
   - Visit one of the following faucets:
     - [Chainlink Faucet](https://faucets.chain.link/sepolia)
     - [Sepolia Faucet (Netlify)](https://sepoliafaucet.netlify.app/)
   - Enter your wallet address and request test ETH.

---

## Deployment and Testing

### Deploy the Contract
1. **Open Remix IDE**: [Remix](https://remix.ethereum.org)
2. In the **Deploy & Run Transactions** tab, select **Injected Provider - MetaMask**.
3. **Connect MetaMask** to Remix when prompted.
4. **Enter Constructor Parameters**:
   - **Goal**: `1000000000000000000` (1 ETH in wei)
   - **Duration**: `600` (10 minutes in seconds)
5. **Click Deploy** and confirm the transaction in MetaMask.

---

### Testing the Contract

#### 1. Contribute to the Campaign
1. **Switch to a different MetaMask account** (not the owner).
2. In the **Value (wei)** field, enter:
   - Example: `500000000000000000` (0.5 ETH).
3. **Click the contribute() function** and confirm the transaction in MetaMask.

#### 2. Withdraw Funds (if Goal is Met)
1. **Switch back to the owner’s account**.
2. **Click the withdraw() function** in Remix.
3. Confirm the transaction in MetaMask.
   - If the goal is met, funds will be transferred to the owner’s wallet.

#### 3. Request Refund (if Goal is Not Met)
1. Wait for the **deadline to pass** without meeting the goal.
2. **Switch to a contributor’s account**.
3. **Click the refund() function** and confirm the transaction in MetaMask.
   - Contributors will receive their ETH back.

---

## Troubleshooting

- **Injected Web3 Not Visible in Remix**:
  - Ensure MetaMask is **unlocked** and connected to the **Sepolia Testnet**.
  - Try refreshing Remix or restarting the browser.

- **Insufficient Funds Error**:
  - Ensure you have test ETH from a **faucet**.
  - Check your wallet balance under Sepolia ETH.

- **Deployment Fails**:
  - Verify the constructor parameters.
  - Check the **gas limit** and increase it if needed.

---

## Conclusion

This project successfully demonstrates a **crowdfunding platform on the Ethereum blockchain** using Vyper. It has been deployed and tested on the **Sepolia Testnet**, ensuring that all functionalities work as expected before deploying on the mainnet.

---
