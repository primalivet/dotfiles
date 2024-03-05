local ok, null_ls = pcall(require, "null-ls")

if not ok then
  print("null-ls not found")
  return
end

local root_has_file = function(file)
  return function(utils)
    local has_file =  utils.root_has_file(file)
    return has_file
  end
end

local eslint_root_files = { ".eslintrc", ".eslintrc.cjs", ".eslintrc.js", ".eslintrc.json" }
local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
local stylua_root_files = { "stylua.toml", ".stylua.toml" }
local ocamlformat_root_files = { "ocamlformat", ".ocamlformat" }
local clang_format_root_files = { ".clang-format" }

local json_file_has_field = function(filename, fieldname)
  return function(utils)
    if not utils.root_has_file(filename) then return false end
    local contents = vim.fn.readfile(vim.fn.getcwd() .. "/" .. filename)
    return vim.fn.json_decode(contents)[fieldname] ~= nil
  end
end

local opts = {
  eslint_formatting = {
    condition = function(utils)
      local has_eslint = root_has_file(eslint_root_files)(utils)
      local has_prettier = root_has_file(prettier_root_files)(utils)
      local has_package_json_eslint = json_file_has_field("package.json", "eslintConfig")(utils)
      local has_package_json_prettier = json_file_has_field("package.json", "prettier")(utils)
      local has_package_json_config = has_package_json_eslint and not has_package_json_prettier
      return (has_eslint and not has_prettier) or (has_package_json_config)
    end,
  },
  eslint_diagnostics = {
    condition = root_has_file(eslint_root_files),
  },
  prettier_formatting = {
    condition = function(utils)
      local has_package_json_prettier = json_file_has_field("package.json", "prettier")(utils)
      return root_has_file(prettier_root_files)(utils) or has_package_json_prettier
    end,
  },
  stylua_formatting = {
    condition = root_has_file(stylua_root_files),
  },
  ocamlformat_formatting = {
    condition = root_has_file(ocamlformat_root_files),
  },
  clang_format_formatting = {
    condition = root_has_file(clang_format_root_files),
  },
}

local function on_attach(client, _)
  if client.server_capabilities.document_formatting then
    vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
  end
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint.with(opts.eslint_diagnostics),
    null_ls.builtins.formatting.eslint.with(opts.eslint_formatting),
    null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
    null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
    null_ls.builtins.formatting.ocamlformat.with(opts.ocamlformat_formatting),
    null_ls.builtins.formatting.clang_format.with(opts.clang_format_formatting),
    null_ls.builtins.code_actions.eslint.with(opts.eslint_diagnostics),
    null_ls.builtins.code_actions.gitsigns,
  },
  on_attach = on_attach,
})
