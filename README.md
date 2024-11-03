
# Bootcamp Setup with Ansible

This repository contains Ansible playbooks for setting up a bootcamp environment. The setup includes installing Ruby, common packages, PostgreSQL, and NVM (Node Version Manager) for managing Node.js versions.

## Requirements

Before you begin, ensure you have the following installed on your local machine:

-   Ansible
-   Access to the target machine(s) where the setup will be applied

## Setup

1. **Clone the Repository**

	First, clone the repository to your local machine. You can use either of the following methods:
    ```
    git clone https://github.com/ungkairt/ansible-bootcamp
    cd ansible-bootcamp
    ```
	Alternatively, if you prefer to use the setup script, use the following command:
	```
	curl -o- https://raw.githubusercontent.com/ungkairt/ansible-bootcamp/main/resources/setup | bash
    cd ansible-bootcamp
    ```
2.  **Configure Variables**
Edit the `app-vars.yml` file to specify your target variables. For example:
	```
	ruby_version: 3.3.3
	nodejs_version: "lts"
	postgresql_version: "14"
	```

	**Ansible Vault default password is** `3412`. You must set the Ansible Vault password for sudo access. Use the following command:
	 ```
	 # su password supersecret
	su_password: 3412
	 ```
3. **Run the Playbook**
	To execute the playbook and set up the environment, use the following command. If your playbook includes encrypted variables and you use Ansible Vault, you will need to enter the vault password `3412`:
	```
	make all
	```
	If need to debug, use the following command:
	```
	make debug
	```
	Athiwat Khamnon (eiei)

