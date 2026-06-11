# Nova.nvim

Neovim port of the [Nova Vim colorscheme](https://github.com/iammerrick/nova-vim).

![Screenshot](https://raw.githubusercontent.com/iammerrick/nova-vim/master/assets/screenshot.png)

## Installation

### With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{ "knt419/nova.nvim", lazy = false }
```

Then in your `init.lua`:

```lua
vim.cmd.colorscheme("nova")
```

## Configuration

### Transparent Background

Enable transparent background with options:

**With lazy.nvim:**
```lua
{ 
  "knt419/nova.nvim", 
  lazy = false,
  config = function()
    vim.cmd.colorscheme("nova", { transparent_bg = true })
  end
}
```

**Or with global variable:**
```lua
vim.g.nova_transparent_bg = true
vim.cmd.colorscheme("nova")
```

## License

MIT
