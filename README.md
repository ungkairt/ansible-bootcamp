# Setup

    curl -o- https://raw.githubusercontent.com/ppp3ppj/ansible-bootcamp/main/resources/setup | sh -

# Run playbook

    ansible-playbook playbooks/machine-ubuntu.yml --ask-become-pass

# Bootcamp Setup with Ansible

This repository contains Ansible playbooks for setting up a bootcamp environment. The setup includes installing Ruby, common packages, PostgreSQL, and NVM (Node Version Manager) for managing Node.js versions.

## Requirements

Before you begin, ensure you have the following installed on your local machine:

-   Ansible
-   Access to the target machine(s) where the setup will be applied

## Setup

1.  **Clone the Repository**
    ```
    git clone https://github.com/ppp3ppj/ansible-bootcamp
    cd ansible-bootcamp
    ```
2.  **Configure Variables**
Edit the `app-vars.yml` file to specify your target username. For example:
`
deploy_user:        ppp_bootcamp
` you can use `whoami` for get username for enter in this target username and you can configure variables like this
	```
	ruby_version: 3.3.3
	nodejs_version: "lts"
	postgresql_version: "14"
	```
	**Ansible Vault default password is** `3412`
	**MUST** set  ansible edit vault sudo password first, use the following command:
	 `make edit_vault`  and set your sudo password like this:
	 ```
	 # su password supersecret
	su_password: 3412
	 ```
3. **Run the Playbook**
	To execute the playbook and set up the environment, use the following command. If your 		playbook includes encrypted variables and you use Ansible Vault, you will need enter vault password is `3412`
	```
	make all
	```
	If need to debug, use the following command:
	```
	make debug
	```

