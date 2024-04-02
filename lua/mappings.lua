require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map({"n", "v"}, "<C-z>", "u"    , {desc = "undo"                         })
map({"n", "v"}, "<C-y>", "<C-r>", {desc = "redo"                         })
map({"n", "v"}, "x"    , "\"_x" , {desc = "erase char"                   })
map({"n", "v"}, "X"    , "\"_x" , {desc = "erase char"                   })
map({"n", "v"}, "<Del>", "\"_d" , {desc = "delete char"                  })
map({"n", "v"}, "d"    , "\"_d" , {desc = "delete char"                  })
map({"n", "v"}, "dd"   , "\"_dd", {desc = "delete line"                  })
map({"n", "v"}, "D"    , "\"_D" , {desc = "delete until the end of line" })

map("n", "<PageUp>"  , "<C-u>"                , {desc = "scroll up"             })
map("n", "<PageDown>", "<C-d>"                , {desc = "scroll down"           })
map("n", "<A-Left>"  , "<C-w>h"               , {desc = "Window left"           })
map("n", "<A-Right>" , "<C-w>l"               , {desc = "Window right"          })
map("n", "<A-Down>"  , "<C-w>j"               , {desc = "Window down"           })
map("n", "<A-Up>"    , "<C-w>k"               , {desc = "Window up"             })
map("n", "<leader>gc", "<cmd> Git commit<CR>" , {desc = "fugitive 'git commit'" })
map("n", "<leader>gs", "<cmd> Git<CR>"        , {desc = "fugitive"              })
map("n", "<C-Up>"    , "# zz"                 , {desc = "find word above"       })
map("n", "<C-Down>"  , "* zz"                 , {desc = "find word below"       })
