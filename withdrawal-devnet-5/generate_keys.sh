#!/bin/bash

val=5000

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
  el_address=$(cat inventory/group_vars/all.yaml | yq .fee_recipient)
  genesis_root=$(cat custom_config_data/parsedBeaconState.json | jq -r .genesis_validators_root)
  genesis_version=$(cat custom_config_data/config.yaml |  yq .GENESIS_FORK_VERSION)
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
    eth2-val-tools bls-address-change \
    --withdrawals-mnemonic="$validators_source_mnemonic" \
    --execution-address="$el_address" \
    --source-min="$validators_source_min" \
    --source-max="$validators_source_max" \
    --genesis-validators-root=$genesis_root \
    --fork-version="$genesis_version" \
    --as-json-list=true > "validator_prep/$naming_prefix-$node_index/change_operations.json"
  done
}
prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 12 "withdrawal-devnet-5-lighthouse-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 12 12 "withdrawal-devnet-5-lighthouse-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 24 12 "withdrawal-devnet-5-prysm-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 36 12 "withdrawal-devnet-5-prysm-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 48 6 "withdrawal-devnet-5-lighthouse-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 54 6 "withdrawal-devnet-5-lighthouse-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 60 6 "withdrawal-devnet-5-prysm-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 66 6 "withdrawal-devnet-5-prysm-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 72 5 "withdrawal-devnet-5-teku-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 77 3 "withdrawal-devnet-5-teku-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 80 5 "withdrawal-devnet-5-teku-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 85 2 "withdrawal-devnet-5-teku-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 87 4 "withdrawal-devnet-5-nimbus-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 91 4 "withdrawal-devnet-5-nimbus-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 95 3 "withdrawal-devnet-5-nimbus-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 98 3 "withdrawal-devnet-5-nimbus-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 101 3 "withdrawal-devnet-5-lodestar-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 103 2 "withdrawal-devnet-5-lodestar-ethereumjs" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 106 2 "withdrawal-devnet-5-lodestar-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 108 3 "withdrawal-devnet-5-lodestar-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 111 2 "withdrawal-devnet-5-lodestar-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_1" 0 1 "withdrawal-devnet-5-lighthouse-geth-evil" 1000