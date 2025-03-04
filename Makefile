switch-macbook-pro:
	darwin-rebuild switch --flake .#$(FLAKE)

check-macbook-pro:
	darwin-rebuild check --flake .#$(FLAKE)

update:
	nix flake update

format:
	nix fmt
