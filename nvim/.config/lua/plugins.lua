local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"

    -- Simple plugins can be specified as strings
    use "TimUntersberger/neogit"

    -- TJ created lodash of neovim
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- All the things
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/nvim-cmp"
    use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use "onsails/lspkind-nvim"
    use "nvim-lua/lsp_extensions.nvim"
    use "glepnir/lspsaga.nvim"
    use "simrat39/symbols-outline.nvim"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- Primeagen doesn"t create lodash
    use "ThePrimeagen/git-worktree.nvim"
    use "ThePrimeagen/harpoon"
    use "ThePrimeagen/refactoring.nvim"

    use "mbbill/undotree"

    -- Colorscheme section
    use "gruvbox-community/gruvbox"
    use "folke/tokyonight.nvim"
    use({"catppuccin/nvim", as = "catppuccin" })
    use({"rose-pine/neovim", as = "rose-pine" })

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use {
      "mhartington/formatter.nvim",
      config = [[ require('plugins/formatter') ]]
    }

    use "nvim-treesitter/playground"
    use "romgrk/nvim-treesitter-context"

    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"

    if packer_bootstrap then
      require("packer").sync()
    end
  end
}
