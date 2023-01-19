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

prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 7 "withdrawal-devnet-3-teku-geth" 2000 
prep_group 1 "$VALIDATORS_MNEMONIC_0" 7 7 "withdrawal-devnet-3-teku-nethermind" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 14 1 "withdrawal-devnet-3-lighthouse-geth" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 15 1 "withdrawal-devnet-3-prysm-geth" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 16 1 "withdrawal-devnet-3-lodestar-geth" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 17 1 "withdrawal-devnet-3-lighthouse-nethermind" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 18 1 "withdrawal-devnet-3-prysm-nethermind" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 19 1 "withdrawal-devnet-3-lodestar-nethermind" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 20 1 "withdrawal-devnet-3-nimbus-geth" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 21 1 "withdrawal-devnet-3-nimbus-nethermind" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 22 1 "withdrawal-devnet-3-lodestar-ethereumjs" 2000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 460 1 "withdrawal-devnet-3-lighthouse-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 461 1 "withdrawal-devnet-3-prysm-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 462 1 "withdrawal-devnet-3-lodestar-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 463 1 "withdrawal-devnet-3-nimbus-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 464 1 "withdrawal-devnet-3-teku-besu" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 465 1 "withdrawal-devnet-3-lighthouse-erigon" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 466 1 "withdrawal-devnet-3-prysm-erigon" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 467 1 "withdrawal-devnet-3-lodestar-erigon" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 468 1 "withdrawal-devnet-3-nimbus-erigon" 100
prep_group 1 "$VALIDATORS_MNEMONIC_0" 469 1 "withdrawal-devnet-3-teku-erigon" 100
prep_group 1 "$VALIDATORS_MNEMONIC_1" 0 1 "extra_key_1" 50
prep_group 1 "$VALIDATORS_MNEMONIC_2" 0 1 "extra_key_2" 50
prep_group 1 "$VALIDATORS_MNEMONIC_3" 0 1 "extra_key_3" 50
prep_group 1 "$VALIDATORS_MNEMONIC_4" 0 1 "extra_key_4" 50