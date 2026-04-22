---@module 'lazy'
---@type LazySpec
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>p',
        function()
          require('conform').format { async = true }
        end,
        desc = '[F]ormat buffer',
      },
    },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      notify_on_error = false,

      -- Format on save logic
      format_on_save = function(bufnr)
        -- You can specify filetypes to autoformat on save here:
        local enabled_filetypes = {
          -- lua = true,
          -- python = true,
        }
        if enabled_filetypes[vim.bo[bufnr].filetype] then
          return { timeout_ms = 500 }
        else
          return nil
        end
        local ft = vim.bo[bufnr].filetype
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[ft] then
          return nil
        end

        -- JS/TS/JSON/CSS: skip LSP, always run Prettier
        local skip_lsp = ft:match '^ts' or ft == 'javascript' or ft == 'typescriptreact' or ft == 'json' or ft == 'css'

        return {
          timeout_ms = 2000,
          lsp_format = skip_lsp and nil or 'fallback',
        }
      end,
      default_format_opts = {
        lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
      },
      -- You can also specify external formatters in here.
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },

    -- Ensure Conform re-detects LSP when attaching a new one
    config = function(_, opts)
      require('conform').setup(opts)

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          -- Optional: re-run format_on_save for new LSP
          if vim.bo[bufnr].filetype then
            require('conform').format {
              bufnr = bufnr,
              async = true,
              lsp_format = 'fallback',
            }
          end
        end,
      })
    end,
  },
}
