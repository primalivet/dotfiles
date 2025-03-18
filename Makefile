switch-macbook-pro:
	darwin-rebuild switch --flake .#macbook-pro

check-macbook-pro:
	darwin-rebuild check --flake .#macbook-pro

update:
	nix flake update

format:
	nix fmt
