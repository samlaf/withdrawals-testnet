## General information
enode for execution clients:
```sh
- "enode://c0c4f0e4325de37ca7bc2bf01783160852317df7cf8f71e51913c4a91c91bf8451566820bdbb316b66672ec62c9c2adf64712e2a230daf3c06c284223afc7ce1@165.232.92.90:30303"
```

enr for consensus clients:
```sh
- "enr:-KG4QJA0CmZHVOQ3uWKipSd_NQ7O4qWHDL7t-wJLGksXphLnWisLkg7uOxSUmSoACstlvguLqwzWB0xECeu0cIVmlgsDhGV0aDKQEQKFwEAAAEAUAAAAAAAAAIJpZIJ2NIJpcISl6FxaiXNlY3AyNTZrMaECh6-QcBGsRtPAqfa3Wz26hgrZGGAtY3H4F1wl08iQW5iDdGNwgiMog3VkcIIjKA"
```
or multiaddrs for consensus client:
```sh
- "/ip4/165.232.92.90/tcp/9000/p2p/16Uiu2HAm4ZLHihurHz5XWkhuAUdnKdWdMh44twrSJjE3Pp53tpoy"
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

