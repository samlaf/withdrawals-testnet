## General information
enode for execution clients:
```sh
- "enode://97d0bc13ddce8b447cac6501005dea9c3efc8039f04b3344a8ee0f296e25ce288220bf84059c83a998c76ad8d8b811cda7da23e55f87da036f7d5caafb31e693@165.232.92.90:30303"
```

enr for consensus clients:
```sh
- "enr:-KG4QJxX9TKvVkptd9h-G_75SPon-WE6NJdsSIaKT13-4bzJCFnUkOPt1fQ_yAiOO-hVvi3aXPI5u5JWbcM9URs_zzADhGV0aDKQEQKFwEAAAEAUAAAAAAAAAIJpZIJ2NIJpcISl6FxaiXNlY3AyNTZrMaECDYeaAG1Xq9pCYV2DWTRipvrm-wJJlWL0cHsiruwp9tmDdGNwgiMog3VkcIIjKA"
```
or multiaddrs for consensus client:
```sh
- "/ip4/165.232.92.90/tcp/9000/p2p/16Uiu2HAkvLVCwtJiKEYSNps4tzTyRCP13d2ezqAsCvA5yFwZt2Lp"
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

