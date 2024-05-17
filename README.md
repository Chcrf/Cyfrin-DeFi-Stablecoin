# Cyfrin DeFi Stablecoin

A project by Cyfrin to better understand DeFi Stablecoins.

<br>

# About

This project is meant to allow users to deposit Ethereum and Bitcoin as collateral in exchange for a token that is pegged to USD.
- [Quickstart](#quickstart)
- [Usage](#usage)
    - [Locally](#locally)
        - [Starting Anvil](#starting-anvil)
        - [Deploying to Anvil](#deploying-to-anvil)
    - [Other Networks](#other-networks)
- [Difference Between Course Code](#difference-between-course-code)


# Quickstart
```
git clone https://github.com/Chcrf/Cyfrin-DeFi-Stablecoin.git
cd Cyfrin-foundry-defi-stablecoin
forge build
```

# Usage
## Locally
### Starting Anvil
```
make anvil
```

### Deploying to Anvil
```
make deploy
```

## Other Networks
1. Setup environment variables
```
SEPOLIA_RPC_URL=<FILL_IN>
PRIVATE_KEY=<FILL_IN>
ETHERSCAN_API_KEY=<FILL_IN>
```
2. Deploy
```
make deploy ARGS="--network sepolia"
```

# Difference Between Course Code
- Implemented my own test cases
- Utilizes the latest openzeppelin contracts

# Credits
https://updraft.cyfrin.io/courses/advanced-foundry