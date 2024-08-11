return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local nvim_lsp = require("lspconfig")

      local on_attach = function(client, bufnr)
        -- Enable LSP-based formatting only if the client supports it
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = true })
            end,
          })
        end
      end

      -- TypeScript
      nvim_lsp.tsserver.setup({
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
      })

      -- Lua
      nvim_lsp.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              -- LuaJIT in the case of Neovim
              version = "LuaJIT",
            },
            diagnostics = {
              -- Recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
        on_attach = on_attach,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      require("mason-lspconfig").setup({})
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "LazyFile",
    dependencies = { "mason.nvim" },
    init = function()
      LazyVim.on_very_lazy(function()
        LazyVim.format.register({
          name = "none-ls.nvim",
          priority = 200, -- set higher than conform, the builtin formatter
          primary = true,
          format = function(buf)
            return LazyVim.lsp.format({
              bufnr = buf,
              filter = function(client)
                return client.name == "null-ls"
              end,
            })
          end,
          sources = function(buf)
            local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
            return vim.tbl_map(function(source)
              return source.name
            end, ret)
          end,
        })
      end)
    end,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")

      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
      })

      vim.keymap.set("n", ";;", function()
        vim.lsp.buf.format({ async = true })
      end)
    end,
  },
}
