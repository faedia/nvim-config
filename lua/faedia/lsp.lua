local Snacks = require('snacks.picker')

-- setup diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

vim.keymap.set('n', '<leader>q', Snacks.diagnostics, { desc = 'Open diagnostic list'})

-- configure LSP
-- this gets run when an LSP connects to a buffer
local on_attach = function(_, bufnr)
	-- map a key map in normal mode with the buffer
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', Snacks.lsp_definitions, '[G]oto [D]efinition')
	nmap('gr', Snacks.lsp_references, '[G]oto [R]eferences')
	nmap('gI', Snacks.lsp_implementations, '[G]oto [I]mplementation')
	nmap('<leader>D', Snacks.lsp_type_definitions, 'Type [D]efinition')

	nmap('gic', Snacks.lsp_incoming_calls, '[G]et [I]ncoming [C]alls')
	nmap('goc', Snacks.lsp_outgoing_calls, '[G]et [O]utgoing [C]alls')

	nmap('<leader>ds', Snacks.lsp_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', Snacks.lsp_workspace_symbols, '[W]orkspace [S]ymbols')

	-- setup basic keymaps
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end


-- setup mason
require('mason').setup()

-- default required servers for my usecase
local servers = {
	lua_ls = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},

		},
	},
}

-- setup neodev
require('neodev').setup()

-- allows us to add aditional capabilities to broadcast to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config('*', {
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.config('lua_ls', {
	settings = servers.lua_ls,
})

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers)
}

for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
	vim.lsp.config(server_name, {
		capabilities = capabilities,
		on_attach = on_attach,
		settings = servers[server_name],
	})
end

local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}
