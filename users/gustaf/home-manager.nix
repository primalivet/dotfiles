{ config, lib, pkgs, ... }: {
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    curl
    lua-language-server
    neovim
    nodejs_23
    ollama
    stow
    tree
    vim
  ];

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
    };
    shellAliases = {
      vi = "nvim";
      ls = "ls --color";
      ll = "ls -al";
    };
    initExtra = ''
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
      co = "checkout";
      c = "commit";
      s = "status";
      d = "diff";
      l = "log --oneline --graph";
      a = "add";
    };
    includes = [
      { condition = "gitdir:~/Code/HB/"; path = "~/.hb/gitconfig"; }
      { condition = "gitdir:~/Code/VCE/";  path = "~/.vce/gitconfig"; }
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

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_state$git_status$character";
      right_format = "$nix_shell";
      directory = { format = "$path "; };
      character = { success_symbol = "%"; error_symbol = "%(bold red)"; };
      git_branch = { format = "$branch(:$remote_branch) "; };
      git_state = { format = "[$state($progress_current/$progress_total)]($style) "; };
      git_status = { format = "([$all_status$ahead_behind]($style) )"; };
      nix_shell = { format = "$symbol$name $state "; symbol = "❄️"; };
    };
  };

  programs.fzf = {
    enable = true;
    defaultCommand = "rg --files --hidden --glob '!.git'";
    defaultOptions = [ "--height 100%" "--reverse" "--color=bw" ];
  };

  programs.fd.enable = true;

  programs.jq.enable = true;

  programs.direnv.enable = true;

  programs.zoxide.enable = true;

  programs.ripgrep = {
    enable = true;
    arguments = [ "--hidden" "--glob=!.git/*" "--smart-case" ];
  };

  xdg.configFile = {
    nvim.source = ./.config/nvim;
    ghostty.source = ./.config/ghostty;
  };

  home.file = {
    ".local/bin".source = ./.local/bin;
  };
}
