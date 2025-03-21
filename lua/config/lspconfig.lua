return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local lspconfig = require("lspconfig")
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

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
    }

    ---@diagnostic disable-next-line: unused-local
    local function on_attach(client, bufnr)
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts);
      map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts);
      map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts);
      map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts);
      map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts);
      map('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts);
      map('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next({float = {border = "rounded"}})<CR>', opts);
      map('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev({float = {border = "rounded"}})<CR>', opts);
    end

    local capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = true,
          lineFoldingOnly = true,
        }
      }
    }

    capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
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
    })

    lspconfig.jdtls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.intelephense.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.volar.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    -- FIX this ltex_extra call is not working properly
    lspconfig.ltex.setup({
      root_dir = lspconfig.util.root_pattern('*.tex'),
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        require("ltex_extra").setup {
          load_langs = { "en-CA" },
          init_check = true,
          path = os.getenv("HOME") .. "/.config/nvim/dictionaries",
          log_level = "none",
        }
      end,
      capabilities = capabilities,
      handlers = handlers,
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
    })

    lspconfig.bashls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.cssls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.emmet_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'php', 'vue' },
      init_options = {
        html = {
          options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            ["output.selfClosingStyle"] = "xhtml"
          },
        },
      }
    })

    lspconfig.eslint.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        workingDirectories = { mode = 'auto' },
        experimental = {
          useFlatConfig = true,
        },
      }
    })

    lspconfig.hls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "cva\\(((?:[^()]|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              { "cx\\(((?:[^()]|\\([^()]*\\))*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" }
            },
          },
        },
      }
    })

    lspconfig.ts_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.yamlls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    lspconfig.taplo.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    -- lspconfig.sqlls.setup({
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    --   handlers = handlers,
    -- })

    lspconfig.zls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    })

    vim.o.signcolumn = "yes:1"
  end,
}
