local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--config-precendece",
      "prefer-file",
      "--stdin-filepath",
      vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
    },
    stdin = true
  }
end

require("formatter").setup(
  {
    filetype = {
      html = {
        prettier
      },
      css = {
        prettier
      },
      json = {
        prettier
      },
      markdown = {
        prettier
      },
      javascript = {
        prettier
      },
      javascriptreact = {
        prettier
      },
      java = {
        prettier
      },
      sh = {
        prettier
      },
      zsh = {
        prettier
      },
      bash = {
        prettier
      },
      typescript = {
        prettier
      },
      typescriptreact = {
        prettier
      },
      terraform = {
        function()
          return {
            exe = "terraform fmt",
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      python = {
        -- Configuration for psf/black
        function()
          return {
            exe = "black", -- this should be available on your $PATH
            args = {"-"},
            stdin = true
          }
        end
      }
    }
  }
)

vim.api.nvim_exec([[
	augroup TrimTrailingWhiteSpace
      au!
      au BufWritePre * %s/\s\+$//e
      au BufWritePre * %s/\n\+\%$//e
  augroup END
]],
  true
)
