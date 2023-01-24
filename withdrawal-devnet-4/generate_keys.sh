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
prep_group 1 "$VALIDATORS_MNEMONIC_0" 0 4 "withdrawal-devnet-4-lighthouse-geth" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 4 4 "withdrawal-devnet-4-lighthouse-nethermind" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 8 4 "withdrawal-devnet-4-prysm-geth" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 12 4 "withdrawal-devnet-4-prysm-nethermind" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 16 2 "withdrawal-devnet-4-lighthouse-besu" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 18 2 "withdrawal-devnet-4-lighthouse-erigon" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 20 2 "withdrawal-devnet-4-prysm-besu" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 22 2 "withdrawal-devnet-4-prysm-erigon" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 24 2 "withdrawal-devnet-4-teku-geth" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 26 1 "withdrawal-devnet-4-teku-besu" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 27 1 "withdrawal-devnet-4-teku-nethermind" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 28 1 "withdrawal-devnet-4-teku-erigon" 15000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 44 2 "withdrawal-devnet-4-nimbus-geth" 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 46 2 "withdrawal-devnet-4-nimbus-besu" 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 48 2 "withdrawal-devnet-4-nimbus-nethermind" 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 50 1 "withdrawal-devnet-4-nimbus-erigon" 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 51 1 "withdrawal-devnet-4-lodestar-geth" 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 52 2 "withdrawal-devnet-4-lodestar-ethereumjs" 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 54 1 "withdrawal-devnet-4-lodestar-besu" 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 55 1 "withdrawal-devnet-4-lodestar-nethermind" 10000
prep_group 1 "$VALIDATORS_MNEMONIC_0" 56 1 "withdrawal-devnet-4-lodestar-erigon" 10000


echo "435k-440k missing add that to lodestar-erigon"
echo "1k missing, make one for evil"