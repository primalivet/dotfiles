FLAKE ?= macbook-pro

switch:
	darwin-rebuild switch --flake .#$(FLAKE)

check:
	darwin-rebuild check --flake .#$(FLAKE)

update:
	nix flake update

format:
	nix fmt
