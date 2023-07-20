#How to Run


. Ensure you have [Foundry](https://github.com/foundry-rs/foundry) installed.
1. Install the dependencies:
    ```shell
    $ forge install
    $forge build
    $forge test
    ```
1. Run Anvil:
    ```shell
    $ anvil
    ```
1. Set environment variables and deploy contracts:
    ```shell
    $ source .envrc
    $ forge script scripts/DeployDevelopment.s.sol --broadcast --fork-url http://localhost:8545 --private-key $PRIVATE_KEY
    ```
