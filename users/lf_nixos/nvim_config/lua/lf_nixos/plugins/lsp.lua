return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()
        local lspconfig = require("lspconfig")
        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        lspconfig.rust_analyzer.setup({ capabilities = lsp_capabilities })
        lspconfig.lua_ls.setup({ capabilities = lsp_capabilities })
        lspconfig.jedi_language_server.setup({ capabilities = lsp_capabilities })
    end

}
