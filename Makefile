# Define variables
PLAYBOOK = provision.yml
INVENTORY = development.ini
VAULT_FILE = my_vault.yml
ANSIBLE_CONFIG = ansible.cfg

# Targets
all: check_config run_playbook

# Check Ansible configuration
check_config:
	@echo "Checking Ansible configuration..."
	@if [ ! -f $(ANSIBLE_CONFIG) ]; then \
		echo "Ansible configuration file $(ANSIBLE_CONFIG) not found!"; \
		exit 1; \
	else \
		echo "Ansible configuration file $(ANSIBLE_CONFIG) found."; \
	fi

# Run the Ansible playbook
run_playbook:
	@echo "Running Ansible playbook..."
	@ansible-playbook -i inventories/$(INVENTORY) $(PLAYBOOK) --ask-vault-pass --extra-vars '@my_vault.yml'

debug_playbook:
	@echo "Running [DEBUG] Ansible playbook..."
	@ansible-playbook -i inventories/$(INVENTORY) $(PLAYBOOK) --ask-vault-pass --extra-vars '@my_vault.yml' -vvv

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

clean:
	@echo "Cleaning up..."

.PHONY: all check_config run_playbook clean
