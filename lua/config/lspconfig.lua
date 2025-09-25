local flags = require('flags')

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  init = function ()
    vim.o.signcolumn = "yes:1"
  end,
  config = function()
    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
        end

        map('n', 'gd', vim.lsp.buf.definition, "go to definition");
        map('n', 'gD', vim.lsp.buf.declaration, "go to declaration");
        map('n', 'gr', vim.lsp.buf.references, "go to references");
        map('n', 'gi', vim.lsp.buf.implementation, "go to implementation");
        map('n', 'K', function() vim.lsp.buf.hover({ border = border }) end, "hover");
        map('n', '<C-s>', function() vim.lsp.buf.signature_help({ border = border }) end, "signature help");
        map('n', '<C-n>', function() vim.diagnostic.jump({ count = 1, float = true, border = border }) end,
          "go to next diagnostic");
        map('n', '<C-p>', function() vim.diagnostic.jump({ count = -1, float = true, border = border }) end,
          "go to previous diagnositc");

        -- toggle inlay hints
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map(
            'n',
            '<leader>lth',
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })) end,
            'toggle inlay hints'
          )
        end

        -- toggle lsp virtual lines
        local virtual_lines_enabled = false
        map(
          'n',
          '<leader>ltl',
          function()
            virtual_lines_enabled = not virtual_lines_enabled
            vim.diagnostic.config({
              virtual_lines = virtual_lines_enabled,
              virtual_text = not virtual_lines_enabled,
            })
          end,
          'toggle lsp virtual lines'
        )
      end,
    })

    local diagnostics = { virtual_text = { prefix = "icons" } }

    local capabilities = require('blink.cmp').get_lsp_capabilities({
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = false,
        },
      },
      textDocument = {
        foldingRange = {
          dynamicRegistration = true,
          lineFoldingOnly = true,
        }
      }
    })

    local handlers = {
      ["textDocument/hover"] =
          vim.lsp.buf.hover({
            border = border,
            silent = true
          }),
      ["textDocument/signatureHelp"] =
          vim.lsp.buf.signature_help({
            border = border,
            silent = true,
          })
    }

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            },
            diagnostics = {
              globals = { "vim", "use" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      },
      jdtls = {},
      intelephense = {},
      -- FIX this ltex_extra call is not working properly
      ltex = {
        root_dir = require('lspconfig.util').root_pattern('*.tex'),
        ---@diagnostic disable-next-line: unused-local
        on_attach = function(c, b)
          require("ltex_extra").setup {
            load_langs = { "en-CA" },
            init_check = true,
            path = os.getenv("HOME") .. "/.config/nvim/dictionaries",
            log_level = "none",
          }
        end,
        filetypes = { 'latex', 'tex', 'bib' },
        settings = {
          ltex = {
            enabled = { "latex", "tex", "bib" },
            language = "en-CA",
            dictionary = { ["en-CA"] = { "Hisbaan", "Noorani" } },
            disabledRules = {
              ["en-CA"] = {
                "PROFANITY",
                "EN_QUOTES",
                "PASSIVE_VOICE",
                "WHITESPACE_RULE",
                "TOO_LONG_SENTENCE",
              },
            },
            additionalRules = {
              enablePickyRules = true,
              motherTongue = "en-CA",
            },
            latex = {
              environments = {
                verbatim = { "ignore" },
                Verbatim = { "ignore" },
                minted = { "ignore" },
                texttt = { "ignore" },
                forest = { "ignore" },
              },
            },
            markdown = {
              nodes = {
                CodeBlock = { "ignore" },
                FencedCodeBlock = { "ignore" },
                AutoLink = { "dummy" },
                Code = { "dummy" },
              },
            },
          },
        },
      },
      bashls = {},
      clangd = {},
      cssls = {},
      emmet_language_server = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
      },
      -- TODO fix eslint issues with useFlatConfig
      -- eslint = {
      --   settings = {
      --     workingDirectory = { mode = 'auto' },
      --     useFlatConfig = false,
      --     experimental = {
      --       useFlatConfig = false,
      --     }
      --   }
      -- },
      hls = {},
      html = {},
      jsonls = {},
      nil_ls = {},
      pyright = {},
      tailwindcss = {
        settings = {
          tailwindCSS = {
            classFunctions = { "cva", "cn", "cx" },
          },
        }
      },
      ts_ls = {
        root_markers = { ".git" },
        single_file_support = false,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = false,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = false,
              includeInlayEnumMemberValueHints = true,
            },
          }
        },
      },
      rust_analyzer = {},
      yamlls = {},
      taplo = {},
      sqlls = {},
      zls = {},
    }

    -- filter out the servers disabled by `flags.lua`
    local enabled_servers = {}
    for name, cfg in pairs(servers) do
      if flags.lsp.servers[name] then
        enabled_servers[name] = cfg
      end
    end

    if flags.lsp.ensure_installed then
      -- automatically install servers via mason-tool-installer
      local ensure_installed = vim.tbl_keys(enabled_servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
        'prettier',
        'prettierd',
        'yamlfmt',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    end

    -- configure lsp servers
    -- OPTIM see if this can be sped up
    for server, config in pairs(enabled_servers) do
      config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})
      config.handlers = vim.tbl_deep_extend('force', {}, handlers, config.handlers or {})
      config.diagnostics = vim.tbl_deep_extend('force', {}, diagnostics, config.diagnostics or {})

      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end
}
