# Define variables
PLAYBOOK = provision.yml
INVENTORY = davelopment.ini
VAULT_FILE = my_vault.yml

# Run the Ansible playbook
run_playbook:
	@echo "Running Ansible playbook..."
	@ansible-playbook -i inventories/$(INVENTORY) $(PLAYBOOK) --ask-vault-pass

debug_playbook:
	@echo "Running [DEBUG] Ansible playbook..."
	@ansible-playbook -i inventories/$(INVENTORY) $(PLAYBOOK) --ask-vault-pass -vvv

dry_playbook:
	@echo "Running [DRYRUN] Ansible playbook..."
	@ansible-playbook -i inventories/$(INVENTORY) $(PLAYBOOK) --ask-vault-pass --check

# Create a new vault file
create_vault:
	@echo "Creating new Ansible vault file $(VAULT_FILE)..."
	@ansible-vault create $(VAULT_FILE)

# Edit an existing vault file
edit_vault:
	@echo "Editing Ansible vault file $(VAULT_FILE)..."
	@ansible-vault edit $(VAULT_FILE)

# Rekey an existing vault file
rekey_vault:
	@echo "Rekeying Ansible vault file $(VAULT_FILE)..."
	@ansible-vault rekey $(VAULT_FILE)
