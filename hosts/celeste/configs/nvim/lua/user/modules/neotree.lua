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
        event_handlers = {
          {
            event = 'neo_tree_buffer_enter',
            handler = function() highlight.set('Cursor', { blend = 100 }) end,
          },
          {
            event = 'neo_tree_buffer_leave',
            handler = function() highlight.set('Cursor', { blend = 0 }) end,
          },
          {
            event = 'neo_tree_window_after_close',
            handler = function() highlight.set('Cursor', { blend = 0 }) end,
          },
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
          icon = {
            folder_empty = icons.documents.open_folder,
          },
          name = {
            highlight_opened_files = true,
          },
          document_symbols = {
            follow_cursor = true,
            kinds = as.fold(function(acc, v, k)
              acc[k] = { icon = v, hl = lsp_kinds[k] }
              return acc
            end, symbols),
          },
          modified = {
            symbol = icons.misc.circle .. ' ',
          },
          git_status = {
            symbols = {
              added = icons.git.add,
              deleted = icons.git.remove,
              modified = icons.git.mod,
              renamed = icons.git.rename,
              untracked = icons.git.untracked,
              ignored = icons.git.ignored,
              unstaged = icons.git.unstaged,
              staged = icons.git.staged,
              conflict = icons.git.conflict,
            },
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
