-- :TSInstall <language_to_install>  es el codigo para instalar
-- el treesitter de ese lenguaje
-- es un analizador de codigo (muestra errores y esas cosas)
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,


  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    smart_rename = {
      enable = true,
    keymaps = {
        smart_rename = "grr",
        },
        },
    navigation = {
        enable = true,
        keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<A-*>",
            goto_previous_usage = "<A-#>",
      },
    },
    },
    },
}
