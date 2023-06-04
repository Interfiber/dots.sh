return lib:makeModule({
	name = "neotree",
	enabled = true,
	onActivate = function()
		  require('neo-tree').setup({
        sources = { 'filesystem', 'git_status', 'document_symbols' },
        source_selector = {
          winbar = true,
          separator_active = '',
          sources = {
            { source = 'filesystem' },
            { source = 'git_status' },
            { source = 'document_symbols' },
          },
        },
        enable_git_status = true,
        git_status_async = true,
        nesting_rules = {
          ['dart'] = { 'freezed.dart', 'g.dart' },
        },
        filesystem = {
          hijack_netrw_behavior = 'open_current',
          use_libuv_file_watcher = true,
          group_empty_dirs = false,
          follow_current_file = false,
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            never_show = { '.DS_Store' },
          },
          window = {
            mappings = {
              ['/'] = 'noop',
              ['g/'] = 'fuzzy_finder',
            },
          },
        },
        default_component_configs = {
          name = {
            highlight_opened_files = true,
          },
        },
        window = {
          mappings = {
            ['o'] = 'toggle_node',
            ['<CR>'] = 'open',
            ['<c-s>'] = 'split_with_window_picker',
            ['<c-v>'] = 'vsplit_with_window_picker',
            ['<esc>'] = 'revert_preview',
            ['P'] = { 'toggle_preview', config = { use_float = false } },
          },
        },
      })
	end,
})
