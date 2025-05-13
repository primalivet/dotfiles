{ config, lib, pkgs, darwin, ... }:
let
  mergeAttrs = as: builtins.foldl' (acc: set: acc // set) { } as;
  optionalAttrs = lib.attrsets.optionalAttrs;
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  home.stateVersion = "24.11";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    defaultKeymap = "emacs";
    history = {
      save = 100000;
      size = 100000;
    };
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      LANG = "en_US.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
      KEYTIMEOUT = "1";
    } //
    (optionalAttrs isDarwin {
      PATH = "/opt/homebrew/bin:$PATH";
    });
    shellAliases = {
      vi = "nvim";
      ll = "ls -l --color --group-directories-first --time-style=long-iso --human-readable -p";
    };
    initExtra = ''
      PROMPT='%1~ %# '
      export PATH="$HOME/.local/bin:$PATH"
      export DIRJUMP_DIRS="$HOME/Code:2"
      eval $(dirjump init)
      [ -f ~/.zsh_private ] && source ~/.zsh_private
    '';
  };

  programs.git = {
    enable = true;
    userName = "Gustaf Holm";
    userEmail = "gustafholm1@gmail.com";
    aliases = {
      a = "add";
      c = "commit";
      co = "checkout";
      d = "diff";
      l = "log --oneline --graph";
      s = "status";
      sw = "switch";
      cop = "!fuzzy_co() { git checkout $(git branch | fzf); }; fuzzy_co";
    };
    includes = [
      { condition = "gitdir:~/Code/HB/"; path = "~/.hb/gitconfig"; }
      { condition = "gitdir:~/Code/VCE/"; path = "~/.vce/gitconfig"; }
    ];

    extraConfig = {
      push.default = "simple";
      push.autoSetupRemote = true;
      core.editor = "nvim";
      core.filemode = false;
      # TODO: diff tool
      # TODO: merge tool
      color.diff = "auto";
      color.status = "auto";
      color.ui = "auto";
    };
  };

  programs.fzf = {
    enable = true;
    defaultCommand = "rg --files --hidden --glob '!.git'";
    defaultOptions = [ "--height 100%" "--reverse" "--color=bw" ];
  };

  programs.fd.enable = true;

  programs.jq.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };

  programs.zoxide.enable = true;

  programs.ripgrep = {
    enable = true;
    arguments = [ "--hidden" "--glob=!.git/*" "--smart-case" ];
  };

  programs.gnome-shell.enable = !darwin;

  xdg.configFile = {
    nvim.source = ./.config/nvim;
    ghostty.source = ./.config/ghostty;
  };

  home.file = {
    ".local/bin".source = ./.local/bin;
  };
}
