return {
    {"williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls"},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup ({})
            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        end,
    }
}
