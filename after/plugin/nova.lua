-- Apply integration highlights after colorscheme processing completes.
-- In Nvim 0.12+, nvim_set_hl calls during :colorscheme processing are
-- reverted for certain highlight groups (e.g. @keyword, @operator).
-- Running from after/plugin/ works because it executes outside the
-- colorscheme invocation call stack.

require("nova.integrations").load()

-- Register autocommand for runtime :colorscheme changes.
-- Uses defer_fn to apply AFTER the colorscheme command finishes.
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "nova",
  callback = function()
    vim.defer_fn(function()
      require("nova.integrations").load()
    end, 10)
  end,
})
