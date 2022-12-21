#!/bin/bash


if [ -z "$VALIDATORS_MNEMONIC_0" ]; then
  echo "missing mnemonic 0"
  exit 1
fi

function prep_group {
  let group_base=$1
  validators_source_mnemonic="$2"
  let offset=$3
  let keys_to_create=$4
  naming_prefix="$5"
  validators_per_host=$6
  echo "Group base: $group_base"
  for (( i = 0; i < keys_to_create; i++ )); do
    let node_index=group_base+i
    let offset_i=offset+i
    let validators_source_min=offset_i*validators_per_host
    let validators_source_max=validators_source_min+validators_per_host

    echo "writing keystores for host $naming_prefix-$node_index: $validators_source_min - $validators_source_max"
    eth2-val-tools keystores \
    --insecure \
    --prysm-pass="prysm" \
    --out-loc="validator_prep/$naming_prefix-$node_index" \
    --source-max="$validators_source_max" \
    --source-min="$validators_source_min" \
    --source-mnemonic="$validators_source_mnemonic"
  done
}

prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 1 "withdrawal-devnet-0-bootnode" 2000                       # 0 - 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 1 1 "withdrawal-devnet-0-lodestar-geth" 2000                  # 2000 - 4000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 2 1 "withdrawal-devnet-0-teku-geth" 2000                      # 4000 - 6000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 3 1 "withdrawal-devnet-0-lighthouse-geth" 2000                # 6000 - 8000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 4 1 "withdrawal-devnet-0-prysm-geth" 2000                     # 8000 - 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 5 1 "withdrawal-devnet-0-lighthouse-nethermind" 2000          # 10000 - 12000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 6 1 "withdrawal-devnet-0-teku-nethermind" 2000                # 12000 - 14000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 7 1 "withdrawal-devnet-0-lodestar-nethermind" 2000            # 14000 - 16000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 8 1 "withdrawal-devnet-0-prysm-nethermind" 2000               # 16000 - 18000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 9 1 "withdrawal-devnet-0-lighthouse-besu" 2000                # 18000 - 20000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 10 1 "withdrawal-devnet-0-teku-besu" 2000                     # 20000 - 22000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 11 1 "withdrawal-devnet-0-lodestar-besu" 2000                 # 22000 - 24000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 12 1 "withdrawal-devnet-0-prysm-besu" 2000                    # 24000 - 26000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 13 1 "withdrawal-devnet-0-lodestar-ethereumjs" 2000           # 26000 - 28000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 28000 1 "withdrawal-devnet-0-nimbus-besu" 1                   # 28000 - 28001
prep_group 1 "$VALIDATORS_MNEMONIC_0" 28001 1 "withdrawal-devnet-0-nimbus-geth" 1                   # 28001 - 28002
prep_group 1 "$VALIDATORS_MNEMONIC_0" 28002 1 "withdrawal-devnet-0-nimbus-nethermind" 1             # 28002 - 28003