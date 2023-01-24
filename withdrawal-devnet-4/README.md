Spec & features:
https://notes.ethereum.org/@bbusa/withdrawal-devnet-3
We now just try with more validators 
565000 keys
Validator key distribution for devnet 4:
```sh
writing keystores for host withdrawal-devnet-4-lighthouse-geth-1: 0 - 15000
writing keystores for host withdrawal-devnet-4-lighthouse-geth-2: 15000 - 30000
writing keystores for host withdrawal-devnet-4-lighthouse-geth-3: 30000 - 45000
writing keystores for host withdrawal-devnet-4-lighthouse-geth-4: 45000 - 60000
writing keystores for host withdrawal-devnet-4-lighthouse-nethermind-1: 60000 - 75000
writing keystores for host withdrawal-devnet-4-lighthouse-nethermind-2: 75000 - 90000
writing keystores for host withdrawal-devnet-4-lighthouse-nethermind-3: 90000 - 105000
writing keystores for host withdrawal-devnet-4-lighthouse-nethermind-4: 105000 - 120000
writing keystores for host withdrawal-devnet-4-prysm-geth-1: 120000 - 135000
writing keystores for host withdrawal-devnet-4-prysm-geth-2: 135000 - 150000
writing keystores for host withdrawal-devnet-4-prysm-geth-3: 150000 - 165000
writing keystores for host withdrawal-devnet-4-prysm-geth-4: 165000 - 180000
writing keystores for host withdrawal-devnet-4-prysm-nethermind-1: 180000 - 195000
writing keystores for host withdrawal-devnet-4-prysm-nethermind-2: 195000 - 210000
writing keystores for host withdrawal-devnet-4-prysm-nethermind-3: 210000 - 225000
writing keystores for host withdrawal-devnet-4-prysm-nethermind-4: 225000 - 240000
writing keystores for host withdrawal-devnet-4-lighthouse-besu-1: 240000 - 255000
writing keystores for host withdrawal-devnet-4-lighthouse-besu-2: 255000 - 270000
writing keystores for host withdrawal-devnet-4-lighthouse-erigon-1: 270000 - 285000
writing keystores for host withdrawal-devnet-4-lighthouse-erigon-2: 285000 - 300000
writing keystores for host withdrawal-devnet-4-prysm-besu-1: 300000 - 315000
writing keystores for host withdrawal-devnet-4-prysm-besu-2: 315000 - 330000
writing keystores for host withdrawal-devnet-4-prysm-erigon-1: 330000 - 345000
writing keystores for host withdrawal-devnet-4-prysm-erigon-2: 345000 - 360000
writing keystores for host withdrawal-devnet-4-teku-geth-1: 360000 - 375000
writing keystores for host withdrawal-devnet-4-teku-geth-2: 375000 - 390000
writing keystores for host withdrawal-devnet-4-teku-besu-1: 390000 - 405000
writing keystores for host withdrawal-devnet-4-teku-nethermind-1: 405000 - 420000
writing keystores for host withdrawal-devnet-4-teku-erigon-1: 420000 - 435000
writing keystores for host withdrawal-devnet-4-nimbus-geth-1: 440000 - 450000
writing keystores for host withdrawal-devnet-4-nimbus-geth-2: 450000 - 460000
writing keystores for host withdrawal-devnet-4-nimbus-besu-1: 460000 - 470000
writing keystores for host withdrawal-devnet-4-nimbus-besu-2: 470000 - 480000
writing keystores for host withdrawal-devnet-4-nimbus-nethermind-1: 480000 - 490000
writing keystores for host withdrawal-devnet-4-nimbus-nethermind-2: 490000 - 500000
writing keystores for host withdrawal-devnet-4-nimbus-erigon-1: 500000 - 510000
writing keystores for host withdrawal-devnet-4-lodestar-geth-1: 510000 - 520000
writing keystores for host withdrawal-devnet-4-lodestar-ethereumjs-1: 520000 - 530000
writing keystores for host withdrawal-devnet-4-lodestar-ethereumjs-2: 530000 - 540000
writing keystores for host withdrawal-devnet-4-lodestar-besu-1: 540000 - 550000
writing keystores for host withdrawal-devnet-4-lodestar-nethermind-1: 550000 - 560000
writing keystores for host withdrawal-devnet-4-lodestar-erigon-1: 560000 - 570000
```
(lodestar-erigon has to pickup some keys from 435-440k)
1k missing keys for evil node