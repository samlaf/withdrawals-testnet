# Minimal ansible for Ethereum Testnets

This repository is a minimal set of playbooks and inventories required to set up a Consensus Layer(CL) node and a Execution
Layer (EL) node for use in testnets.

# Ansible Galaxy

This repository uses ansible galaxy for some dependencies. You can fetch them using:

```sh
./install_dependencies.sh
```

# Usage
- Fork this repository for your required devnet (Ideally it is a throwaway devnet)
- Modify the `testnets/<name>/inventory/inventory.ini` file with the correct tags and client distribution
- Generate the keys from the mnemonic by running the `generate_keys.sh` file (after exporting the mnemonic)
- If needed, modify the `testnets/<name>/custom_config_data/` folder with the `genesis.ssz` and `eth2_config.yaml`
- Modify the `testnets/<name>/inventory/group_vars/eth2client_<client_name>.yml` if required
- Check the inventory with `ansible-inventory -i testnets/<name>/inventory/dynamic.py --list`
- Run the playbook to run all beacon nodes and validators with ` ansible-playbook -i testnets/<name>/inventory/dynamic.py playbooks/setup_beacon_and_validators_full.yml`


## Examples on how to run the playbooks

### Installing the beaconchain explorer

```sh
# Running the whole playbook
ansible-playbook playbooks/setup_beaconchain_explorer.yml -i withdrawal-devnet-0/inventory/inventory.ini
# Just targeting the beaconchain explorer tag
ansible-playbook playbooks/setup_beaconchain_explorer.yml -i withdrawal-devnet-0/inventory/inventory.ini -t beaconchain_explorer_aio
# Wiping the beaconchain explorer via an extra var
ansible-playbook playbooks/setup_beaconchain_explorer.yml -i withdrawal-devnet-0/inventory/inventory.ini -t beaconchain_explorer_aio -e "beaconchain_explorer_aio_cleanup_all=true"
```
