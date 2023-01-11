Timeline:

Public testnet ideally: ~16th Jan,2023
devnet-2: ~week of 9th Jan, 2023

Spec for devnet2: 

Features:

EIP-6122 : Forkid checks based on timestamps
EIP-4895 : Withdrawals
EIP-3651: Warm COINBASE
EIP-3855 : PUSH0
EIP-3860 : Limit/meter initcode

Spec version needed:

CL: spec v1.3.0-rc.0
EL: eip-4895 @ commit 0fa80ec
Engine API: spec @ commit fb72652

https://notes.ethereum.org/@parithosh/zhejiang-testnet-spec


Validator key distribution for devnet 2:
```sh
withdrawal-devnet-2-teku-geth-1: 0 - 2000
withdrawal-devnet-2-teku-geth-2: 2000 - 4000
withdrawal-devnet-2-teku-geth-3: 4000 - 6000
withdrawal-devnet-2-teku-geth-4: 6000 - 8000
withdrawal-devnet-2-teku-geth-5: 8000 - 10000
withdrawal-devnet-2-teku-geth-6: 10000 - 12000
withdrawal-devnet-2-teku-geth-7: 12000 - 14000
withdrawal-devnet-2-teku-nethermind-1: 14000 - 16000
withdrawal-devnet-2-teku-nethermind-2: 16000 - 18000
withdrawal-devnet-2-teku-nethermind-3: 18000 - 20000
withdrawal-devnet-2-teku-nethermind-4: 20000 - 22000
withdrawal-devnet-2-teku-nethermind-5: 22000 - 24000
withdrawal-devnet-2-teku-nethermind-6: 24000 - 26000
withdrawal-devnet-2-teku-nethermind-7: 26000 - 28000
withdrawal-devnet-2-lighthouse-geth-1: 28000 - 30000
withdrawal-devnet-2-prysm-geth-1: 30000 - 32000
withdrawal-devnet-2-lodestar-geth-1: 32000 - 34000
withdrawal-devnet-2-lighthouse-nethermind-1: 34000 - 36000
withdrawal-devnet-2-prysm-nethermind-1: 36000 - 38000
withdrawal-devnet-2-lodestar-nethermind-1: 38000 - 40000
withdrawal-devnet-2-nimbus-geth-1: 40000 - 42000
withdrawal-devnet-2-nimbus-nethermind-1: 42000 - 44000
withdrawal-devnet-2-lodestar-ethereumjs-1: 44000 - 46000
withdrawal-devnet-2-lighthouse-besu-1: 46000 - 46100
withdrawal-devnet-2-prysm-besu-1: 46100 - 46200
withdrawal-devnet-2-lodestar-besu-1: 46200 - 46300
withdrawal-devnet-2-nimbus-besu-1: 46300 - 46400
withdrawal-devnet-2-teku-besu-1: 46400 - 46500
withdrawal-devnet-2-lighthouse-erigon-1: 46500 - 46600
withdrawal-devnet-2-prysm-erigon-1: 46600 - 46700
withdrawal-devnet-2-lodestar-erigon-1: 46700 - 46800
withdrawal-devnet-2-nimbus-erigon-1: 46800 - 46900
withdrawal-devnet-2-teku-erigon-1: 46900 - 47000
```