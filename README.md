# Config file + genesis state generation 

Understand genesis.ssz and validator generation
```
cd withdrawal-devnet-0
VALIDATORS_MNEMONIC_0="test test test test test test test test test test test junk" ./generate_keys.sh
cd custom_config_data
eth2-testnet-genesis bellatrix --config config.yaml --eth1-config genesis.json --eth1-timestamp 1671469200
```
See this Parithosh' [writeup](https://notes.ethereum.org/@parithosh/H1MSKgm3F).
# Eigenlayer Devnet

spin up the 3 ec2 instances:

```
cd terraform/environment/withdrawal-devnet-0
terraform init
terraform apply
cd ../../..
```

Terraform will output the 3 public_ips of the instances. Copy them into `withdrawal-devnet-0/inventory/inventory.ini`:

```
withdrawal-devnet-0-bootnode-1	ansible_host=<IP_ADDR_1>
withdrawal-devnet-0-lighthouse-geth-1 ansible_host=<IP_ADDR_2>
withdrawal-devnet-0-teku-nethermind-1	ansible_host=<IP_ADDR_3>
```

Setup the machines:

```
ansible-playbook -i withdrawal-devnet-0/inventory/inventory.ini playbooks/provision_machine.yml
```

Start the bootnode

```
ansible-playbook -i withdrawal-devnet-0/inventory/inventory.ini -l withdrawal-devnet-0-bootnode-1 playbooks/setup_execution_and_consensus_full.yml
```

Collect the bootnode's ENR and enode. Copy them to `withdrawal-devnet-0/inventory/group_vars/all.yaml`

```
ansible-playbook -i withdrawal-devnet-0/inventory/inventory.ini -l withdrawal-devnet-0-bootnode-1 playbooks/tasks/collect_enrs.yml
```

Start the all the other (non bootnode) nodes

```
ansible-playbook -i withdrawal-devnet-0/inventory/inventory.ini -l non_bootnodes playbooks/setup_execution_and_consensus_full.yml
```

If you ever need to stop the nodes and wipe their database (possibly to restart them from scratch without destroy the ec2 instances and recreating them)

```
ansible-playbook -i withdrawal-devnet-0/inventory/inventory.ini playbooks/wipe_all.yml
```

For information on the different config files in `withdrawal-devnet-0/custom_config_data` used to start clients, see Protolambda's [devnet setup guide](https://notes.ethereum.org/@protolambda/merge-devnet-setup-guide)

----------------- ORIGINAL README ------------

# Minimal ansible for Ethereum Testnets

This repository is a minimal set of playbooks and inventories required to set up a Consensus Layer(CL) node and a Execution
Layer (EL) node for use in testnets.

# Ansible Galaxy

This repository uses ansible galaxy for some dependencies. You can fetch them using:

```sh
./install_dependencies.sh
```

# Usage

To create/remove additional vms add "sequenceNumber" in the group that you would like to have ("01", "02" ...). ID field is used to to name and tag the different machines.

The script automatically generates inventory file using the "local_file" terraform resource. This uses an ansible_inventory.tmpl file to create the format we usually use. An example of this template file can be found [here](terraform/withdrawals-devnet-2/ansible_inventory.tmpl).

Note: This new terraform module is creating a DNS record in cloudflare (for ethpandaops.com domain by default).

- Fork this repository for your required devnet (Ideally it is a throwaway devnet)
- Modify the `testnets/<name>/inventory/inventory.ini` file with the correct tags and client distribution
- Generate the keys from the mnemonic by running the `generate_keys.sh` file (after exporting the mnemonic)
- If needed, modify the `testnets/<name>/custom_config_data/` folder with the `genesis.ssz` and `eth2_config.yaml`
- Modify the `testnets/<name>/inventory/group_vars/eth2client_<client_name>.yml` if required
- Run the playbook to run all beacon nodes and validators with ` ansible-playbook -i testnets/<name>/inventory/inventory.ini playbooks/setup_beacon_and_validators_full.yml`

## Examples on how to run the playbooks

### Installing the beaconchain explorer

```sh
# Running the whole playbook
ansible-playbook -i withdrawal-devnet-4/inventory/inventory.ini playbooks/setup_beaconchain_explorer.yml
# Just targeting the beaconchain explorer tag
ansible-playbook -i withdrawal-devnet-4/inventory/inventory.ini playbooks/setup_beaconchain_explorer.yml -t beaconchain_explorer_aio
# Wiping the beaconchain explorer via an extra var
ansible-playbook -i withdrawal-devnet-4/inventory/inventory.ini playbooks/setup_beaconchain_explorer.yml  -t beaconchain_explorer_aio -e "beaconchain_explorer_aio_cleanup_all=true"
```
