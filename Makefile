switch-macbook-pro:
	darwin-rebuild switch --flake .#macbook-pro

check-macbook-pro:
	darwin-rebuild check --flake .#macbook-pro

update:
	nix flake update

format:
	nix fmt

iso: 
	nix build .#nixosConfigurations.iso-aarch64.config.system.build.isoImage

connected-install:
	@if [ -z "$(MACHINE_IP)" ]; then \
		echo "MACHINE_IP is not set"; \
		exit 1; \
	fi
	@echo "Trying to login to $(MACHINE_IP)"
	scp install-homelab-machine.sh nixos@$(MACHINE_IP):/home/nixos
	ssh nixos@$(MACHINE_IP) "chmod +x install-homelab-machine.sh"
	@echo "Run 'sudo ./install-homelab-machine.sh <machine-name>' to start the installation."
	ssh nixos@$(MACHINE_IP)

# TODO: the installer script has a dialog for proceeding that does not work
# optimal over ssh, since "read" probably does not work, so the user does not
# see the question. If works to answer though.
remote-install: install-homelab-machine.sh
	@if [ -z "$(MACHINE_NAME)" ]; then \
		echo "MACHINE_NAME is not set"; \
		exit 1; \
	fi
	@if [ -z "$(MACHINE_IP)" ]; then \
		echo "MACHINE_IP is not set"; \
		exit 1; \
	fi
	@echo "Trying to installing $(MACHINE_NAME) on $(MACHINE_IP)"
	scp install-homelab-machine.sh nixos@$(MACHINE_IP):/home/nixos
	ssh nixos@$(MACHINE_IP) "chmod +x install-homelab-machine.sh && sudo ./install-homelab-machine.sh $(MACHINE_NAME)"
	ssh nixos@$(MACHINE_IP) "sleep 10 && sudo poweroff"

# TODO: Set default values here for other script arguments, emial, name, etc.
post-install: post-install-homelab-machine.sh
	@if [ -z "$(MACHINE_NAME)" ]; then \
		echo "MACHINE_NAME is not set"; \
		exit 1; \
	fi
	@if [ -z "$(MACHINE_IP)" ]; then \
		echo "MACHINE_IP is not set"; \
		exit 1; \
	fi
	@echo "Trying to do post install $(MACHINE_NAME) on $(MACHINE_IP)"
	./post-install-homelab-machine.sh $(MACHINE_NAME) $(MACHINE_IP)
