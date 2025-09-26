return {
  filetypes = { "ruby" },

  cmd = { "ruby-lsp" },

  root_markers = { "Gemfile", ".git" },

  init_options = {
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
