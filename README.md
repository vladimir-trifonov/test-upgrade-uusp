
## Foundry

**Foundry is a blazing fast, portable, and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat, and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions, and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache and Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose Solidity REPL.

## Documentation

-   Official Foundry documentation: https://book.getfoundry.sh/

---

## Installation

### Upgrade Foundry

To upgrade Foundry to the latest version, run the following command:

```bash
foundryup
```

This will update all components of Foundry (Forge, Cast, Anvil, etc.) to the latest version.

---

## Usage

### Build

To build the project:

```bash
forge build
```

### Test

To run tests:

```bash
forge test
```

### Format

To format Solidity code:

```bash
forge fmt
```

### Gas Snapshots

To take gas snapshots:

```bash
forge snapshot
```

### Anvil

To run a local Ethereum node (Anvil):

```bash
anvil
```

### Deploy

To deploy a smart contract using a script:

```bash
forge script script/YourScript.s.sol:YourScriptName --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
```

Replace `<your_rpc_url>` with the Ethereum node URL and `<your_private_key>` with the private key of the account deploying the contract.

### Cast

To interact with deployed contracts or query the blockchain:

```bash
cast <subcommand>
```

For example, sending ETH to an address:

```bash
cast send <recipient_address> --value 1ether --private-key <your_private_key> --rpc-url <your_rpc_url>
```

### Help

To get help on each tool, run:

```bash
forge --help
anvil --help
cast --help
```

---

## Kurtosis

**Kurtosis** is a tool that simplifies the development and testing of distributed systems by managing the lifecycle of complex environments, like blockchain testnets, microservices, and more. It allows you to define how services are deployed and orchestrated in your environment using predefined packages.

### What does Kurtosis do?

Kurtosis allows you to set up testnets or other services in enclaves (isolated environments) easily. These enclaves can contain Ethereum testnets, smart contract networks, or even your own infrastructure for development and testing purposes.

### How to Use Kurtosis

1. **Install Kurtosis**

   If you don't have Kurtosis installed, follow the installation instructions from the [Kurtosis documentation](https://docs.kurtosis.com/install).

2. **Start a Local Ethereum Testnet**

   To start an Ethereum testnet using Kurtosis, run the following command:

   ```bash
   kurtosis run --enclave my-testnet github.com/ethpandaops/ethereum-package
   ```

   This command will:
   - **run** a new enclave (isolated environment) using the **ethpandaops** package, which sets up an Ethereum testnet.

3. **Access the Ethereum Testnet**

   Once Kurtosis has started the testnet, it will output connection details such as RPC URLs and account information. Use these details to deploy and interact with smart contracts via Foundry's tools.

---

## Deploying and Upgrading Smart Contracts

### Step 1: Deploy a Smart Contract

To deploy a UUPS upgradable contract using Forge, follow these steps:

1. Run the deployment script:

   ```bash
   forge script script/DeployTestNFTV1.sol --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
   ```

   - `<your_rpc_url>`: The RPC URL of the Ethereum node or testnet (e.g., from Kurtosis).
   - `<your_private_key>`: The private key of the deployer's Ethereum account.

### Step 2: Upgrade the Contract

If you want to upgrade a previously deployed contract using the UUPS proxy pattern:

1. Run the upgrade script:

   ```bash
   PROXY_ADDRESS=<proxy_address> forge script script/DeployTestNFTV2.sol --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
   ```

   - `<proxy_address>`: The address of the UUPS proxy for the contract you wish to upgrade.
   - `<your_rpc_url>` and `<your_private_key>` are the same as before.

This will upgrade the implementation contract behind the UUPS proxy to the new version.

---

## Example Deployment and Upgrade Process

### Example 1: Deploying `TestNFTV1`

To deploy the initial version of the `TestNFTV1` contract, use:

```bash
forge script script/DeployTestNFTV1.sol --rpc-url <rpc_url> --private-key <private_key> --broadcast
```

Replace `<rpc_url>` with the testnet RPC URL (e.g., from Kurtosis), and `<private_key>` with your private key.

### Example 2: Upgrading to `TestNFTV2`

Once `TestNFTV1` is deployed, you can upgrade it to `TestNFTV2` by running:

```bash
PROXY_ADDRESS=<proxy_address> forge script script/DeployTestNFTV2.sol --rpc-url <rpc_url> --private-key <private_key> --broadcast
```

Replace `<proxy_address>` with the proxy address of the deployed contract.

---

## Cleaning Up Enclaves

After working with testnets in Kurtosis, it's a good practice to clean up resources. You can clean all running enclaves with:

```bash
kurtosis clean -a
```

This will stop and remove all running testnets or environments to free up resources.

---

## Conclusion

This `README.md` provides a detailed overview of using Foundry for Ethereum development and Kurtosis for managing testnets. It covers upgrading Foundry, deploying and upgrading contracts, interacting with smart contracts, and managing environments with Kurtosis.

If you encounter any issues, refer to the Foundry [documentation](https://book.getfoundry.sh/) or Kurtosis [docs](https://docs.kurtosis.com/). Happy hacking!
