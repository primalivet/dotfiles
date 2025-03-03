# Commands for NixOS/nix-darwin Dotfiles Repository

## Build & Test Commands
- Check changes: `make check` or `darwin-rebuild check --flake .#macbook-pro`
- Apply changes: `make switch` or `darwin-rebuild switch --flake .#macbook-pro`
- For VM: `nixos-rebuild switch --flake .#vm-aarch64-utm`
- Show flake outputs: `nix flake show`
- Lint nix files: `nix-linter *.nix`

## Code Style Guidelines
- Nix formatting: 2-space indentation, no trailing whitespace
- Structure: Keep related configurations in appropriate directories (machines/, users/, shells/)
- Paths: Use absolute paths, avoid `cd` when possible
- Git commits: Use descriptive, atomic commits with concise messages
- Expression style: Put opening braces on same line as definition (`{ config, lib, ... }: {`)
- Imports: Group and sort imports logically
- Config order: Keep related settings grouped together
- Variable naming: Use camelCase for variables and attributes
- Comments: Use descriptive comments for non-obvious configuration
- Error handling: Use proper error handling patterns from nixpkgs

## Project Organization
- Machine-specific configs in `machines/`
- User-specific configs in `users/` 
- Development shells in `shells/`