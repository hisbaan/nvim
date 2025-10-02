-- default flags that are used to enable or disable certain features throughout the config
local default_config = {
  lsp = {
    ensure_installed = true,
    servers = {
      bashls = true,
      clangd = true,
      cssls = true,
      docker_compose_language_service = true,
      emmet_language_server = true,
      html = true,
      intelephense = true,
      jdtls = true,
      ltex = true,
      lua_ls = true,
      nil_ls = true,
      pyright = true,
      rust_analyzer = true,
      sqlls = false,
      tailwindcss = true,
      taplo = true,
      ts_ls = true,
      yamlls = true,
      zls = true,
    },
    formatters = {
      stylua = true,
      prettier = true,
      prettierd = true,
      yamlfmt = true,
    }
  },
  plugins = {
    copilot = true,
    supermaven = false,
    silicon = false,
  },
}

local success, system_config = pcall(require, 'system-flags')
if not success then system_config = {} end

M = vim.tbl_deep_extend('force', default_config, system_config)

return M;
