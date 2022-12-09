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


prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 1 "withdrawal-devnet-0-lodestar-geth" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 100 1 "withdrawal-devnet-0-bootnode" 20
prep_group 1 "$VALIDATORS_MNEMONIC_0" 101 1 "withdrawal-devnet-0-teku-geth" 20
prep_group 1 "$VALIDATORS_MNEMONIC_0" 102 1 "withdrawal-devnet-0-lighthouse-geth" 20
prep_group 1 "$VALIDATORS_MNEMONIC_0" 103 1 "withdrawal-devnet-0-prysm-geth" 20
prep_group 1 "$VALIDATORS_MNEMONIC_0" 208 1 "withdrawal-devnet-0-lighthouse-nethermind" 10
prep_group 1 "$VALIDATORS_MNEMONIC_0" 209 1 "withdrawal-devnet-0-teku-nethermind" 10
prep_group 1 "$VALIDATORS_MNEMONIC_0" 210 1 "withdrawal-devnet-0-lodestar-nethermind" 10
prep_group 1 "$VALIDATORS_MNEMONIC_0" 211 1 "withdrawal-devnet-0-prysm-nethermind" 10
prep_group 1 "$VALIDATORS_MNEMONIC_0" 424 1 "withdrawal-devnet-0-lighthouse-besu" 5
prep_group 1 "$VALIDATORS_MNEMONIC_0" 425 1 "withdrawal-devnet-0-teku-besu" 5
prep_group 1 "$VALIDATORS_MNEMONIC_0" 426 1 "withdrawal-devnet-0-lodestar-besu" 5
prep_group 1 "$VALIDATORS_MNEMONIC_0" 427 1 "withdrawal-devnet-0-prysm-besu" 5

