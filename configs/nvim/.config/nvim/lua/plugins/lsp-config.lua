return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                -- both are an invalid entry apparently.. guessing there must be the faded text in :Mason to show that its supported
                --"apex_ls",
                --"apex-language-server",
                "lwc_ls",
                "lua_ls",
                "pyright",
            },
            automatic_installation = true,
        }
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.ruby_lsp.setup({
                capabilities = capabilities
            })

            lspconfig.apex_ls.setup({
                apex_enable_semantic_errors = true,
                apex_enable_completion_statistics = false,
                filetypes = {
                    "apex",
                    "cls",
                },
                -- apex_ls requires java to install and run.. also, gpt is pretty sure node needs to be installed x
                cmd = {
                    'java',
                    '-jar',
                    os.getenv("HOME") .. "/.local/share/nvim/mason/packages/apex-language-server/extension/dist/apex-jorje-lsp.jar"
                },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        end,
    },
}
