#!/bin/bash

val=2000

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
prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 2 "zhejiang-testnet-lighthouse-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 2 2 "zhejiang-testnet-lighthouse-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 4 2 "zhejiang-testnet-lighthouse-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 6 2 "zhejiang-testnet-lighthouse-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 8 2 "zhejiang-testnet-prysm-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 10 2 "zhejiang-testnet-prysm-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 12 2 "zhejiang-testnet-prysm-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 14 2 "zhejiang-testnet-prysm-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 16 1 "zhejiang-testnet-teku-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 17 1 "zhejiang-testnet-teku-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 18 1 "zhejiang-testnet-teku-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 19 1 "zhejiang-testnet-teku-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 20 1 "zhejiang-testnet-nimbus-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 21 1 "zhejiang-testnet-nimbus-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 22 1 "zhejiang-testnet-nimbus-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 23 1 "zhejiang-testnet-nimbus-erigon" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 24 1 "zhejiang-testnet-lodestar-geth" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 25 1 "zhejiang-testnet-lodestar-ethereumjs" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 26 1 "zhejiang-testnet-lodestar-besu" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 27 1 "zhejiang-testnet-lodestar-nethermind" $val
prep_group 1 "$VALIDATORS_MNEMONIC_0" 28 1 "zhejiang-testnet-lodestar-erigon" $val

# prep_group 1 "$VALIDATORS_MNEMONIC_7" 0 1 "extra-7" 100
# prep_group 1 "$VALIDATORS_MNEMONIC_8" 0 1 "extra-8" 100
# prep_group 1 "$VALIDATORS_MNEMONIC_9" 0 1 "extra-9" 100
# prep_group 1 "$VALIDATORS_MNEMONIC_10" 0 1 "extra-10" 100