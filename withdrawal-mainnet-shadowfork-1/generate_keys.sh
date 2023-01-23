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

prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 1 "withdrawal-mainnet-shadowfork-1-bootnode" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 1 1 "withdrawal-mainnet-shadowfork-1-lighthouse-besu" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 4 1 "withdrawal-mainnet-shadowfork-1-lighthouse-erigon" 500
prep_group 1 "$VALIDATORS_MNEMONIC_0" 5 1 "withdrawal-mainnet-shadowfork-1-teku-erigon" 500
prep_group 1 "$VALIDATORS_MNEMONIC_0" 3 2 "withdrawal-mainnet-shadowfork-1-lighthouse-geth" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 5 1 "withdrawal-mainnet-shadowfork-1-lighthouse-nethermind" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 6 1 "withdrawal-mainnet-shadowfork-1-lodestar-besu" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 7 1 "withdrawal-mainnet-shadowfork-1-lodestar-geth" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 8 1 "withdrawal-mainnet-shadowfork-1-lodestar-nethermind" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 9 1 "withdrawal-mainnet-shadowfork-1-nimbus-besu" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 10 1 "withdrawal-mainnet-shadowfork-1-nimbus-geth" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 11 1 "withdrawal-mainnet-shadowfork-1-nimbus-nethermind" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 12 1 "withdrawal-mainnet-shadowfork-1-prysm-besu" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 13 2 "withdrawal-mainnet-shadowfork-1-prysm-geth" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 15 1 "withdrawal-mainnet-shadowfork-1-prysm-nethermind" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 16 1 "withdrawal-mainnet-shadowfork-1-teku-besu" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 17 2 "withdrawal-mainnet-shadowfork-1-teku-geth" 1000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 19 1 "withdrawal-mainnet-shadowfork-1-teku-nethermind" 1000

