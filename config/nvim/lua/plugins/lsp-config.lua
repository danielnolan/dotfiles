return {
  {
    'williamboman/mason.nvim',
    lazy = false,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup()
      require('mason-lspconfig').setup_handlers {
        function (server_name)
            require("lspconfig")[server_name].setup {}
        end,
        ["ruby_ls"] = function()
          -- textDocument/diagnostic support until 0.10.0 is released
          _timers = {}
          local function setup_diagnostics(client, buffer)
            if require("vim.lsp.diagnostic")._enable then
              return
            end

            local diagnostic_handler = function()
              local params = vim.lsp.util.make_text_document_params(buffer)
              client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
                if err then
                  local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
                  vim.lsp.log.error(err_msg)
                end
                if not result then
                  return
                end
                vim.lsp.diagnostic.on_publish_diagnostics(
                  nil,
                  vim.tbl_extend("keep", params, { diagnostics = result.items }),
                  { client_id = client.id }
                )
              end)
            end

            diagnostic_handler() -- to request diagnostics on buffer when first attaching

            vim.api.nvim_buf_attach(buffer, false, {
              on_lines = function()
                if _timers[buffer] then
                  vim.fn.timer_stop(_timers[buffer])
                end
                _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
              end,
              on_detach = function()
                if _timers[buffer] then
                  vim.fn.timer_stop(_timers[buffer])
                end
              end,
            })
          end

          require("lspconfig").ruby_ls.setup({
            autostart = false,
            on_attach = function(client, buffer)
              setup_diagnostics(client, buffer)
            end,
          })
        end
      }
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
      })
    end
  }
}
