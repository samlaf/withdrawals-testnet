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
    padding=0
    echo "writing keystores for host $naming_prefix-${padding:${#node_index}:${#padding}}${node_index}: $validators_source_min - $validators_source_max"
    eth2-val-tools keystores \
    --insecure \
    --prysm-pass="prysm" \
    --out-loc="validator_prep/$naming_prefix-${padding:${#node_index}:${#padding}}${node_index}" \
    --source-max="$validators_source_max" \
    --source-min="$validators_source_min" \
    --source-mnemonic="$validators_source_mnemonic"
  done
}

prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 1 "withdrawal-mainnet-shadowfork-2-bootnode" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 1 1 "withdrawal-mainnet-shadowfork-2-lighthouse-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 2 2 "withdrawal-mainnet-shadowfork-2-lighthouse-geth" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 4 1 "withdrawal-mainnet-shadowfork-2-lighthouse-nethermind" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 5 1 "withdrawal-mainnet-shadowfork-2-lodestar-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 6 1 "withdrawal-mainnet-shadowfork-2-lodestar-geth" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 7 1 "withdrawal-mainnet-shadowfork-2-lodestar-nethermind" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 8 1 "withdrawal-mainnet-shadowfork-2-nimbus-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 9 1 "withdrawal-mainnet-shadowfork-2-nimbus-geth" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 10 1 "withdrawal-mainnet-shadowfork-2-nimbus-nethermind" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 11 1 "withdrawal-mainnet-shadowfork-2-prysm-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 12 2 "withdrawal-mainnet-shadowfork-2-prysm-geth" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 14 1 "withdrawal-mainnet-shadowfork-2-prysm-nethermind" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 15 1 "withdrawal-mainnet-shadowfork-2-teku-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 16 2 "withdrawal-mainnet-shadowfork-2-teku-geth" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 17 1 "withdrawal-mainnet-shadowfork-2-teku-nethermind" 100

