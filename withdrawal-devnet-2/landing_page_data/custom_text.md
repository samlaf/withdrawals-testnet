## General information
enode for execution clients:
```sh
- "enode://09f67b2694ec4b2a9f56ec182f3f208ab1d710976f7b13d40197496be0a52f5337b3beb0629270b5d66ddda211d5230b75a8c717a7c7abc7a68e68dd8ad50bd3@165.232.92.90:30303"
```

enr for consensus clients:
```sh
- "enr:-KG4QLZoy4fvyb6QXhRon3JOn_FHHA5kcMGmGfmsnjzfs_MPLN4PzZGw2uFtf7rRGKabgqxMr3FIPFtpYr-bQ3z4sMQDhGV0aDKQEQKFwEAAAEAUAAAAAAAAAIJpZIJ2NIJpcISl6FxaiXNlY3AyNTZrMaEC2EWXXpG8OmVRTsMLMJtd2E513uJLHh680G8QD7Lmfz-DdGNwgiMog3VkcIIjKA"
```
or multiaddrs for consensus client:
```sh
- "/ip4/165.232.92.90/udp/9000/p2p/16Uiu2HAm9yub9gYtSpNLk6Q7CbjbsWtzkCicTrTuxochgJa2iuEe"
```


## Genesis configuration
### Execution layer clients

https://github.com/ethpandaops/withdrawals-testnet/blob/master/withdrawal-devnet-2/custom_config_data/


## Timeline:

Public testnet ideally: ~16th Jan,2023
devnet-2: ~week of 9th Jan, 2023

## Spec for devnet2: 

### Features:

EIP-6122 : Forkid checks based on timestamps
EIP-4895 : Withdrawals
EIP-3651: Warm COINBASE
EIP-3855 : PUSH0
EIP-3860 : Limit/meter initcode

### Spec version needed:

CL: spec v1.3.0-rc.0
EL: eip-4895 @ commit 0fa80ec
Engine API: spec @ commit fb72652

https://notes.ethereum.org/@parithosh/zhejiang-testnet-spec

