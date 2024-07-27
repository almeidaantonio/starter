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

map("n", "<PageUp>"  , "<C-u>"                , {desc = "scroll up"                })
map("n", "<PageDown>", "<C-d>"                , {desc = "scroll down"              })
map("n", "<A-Left>"  , "<C-w>h"               , {desc = "Window left"              })
map("n", "<A-Right>" , "<C-w>l"               , {desc = "Window right"             })
map("n", "<A-Down>"  , "<C-w>j"               , {desc = "Window down"              })
map("n", "<A-Up>"    , "<C-w>k"               , {desc = "Window up"                })
map("n", "<leader>gc", "<cmd> Git commit<CR>" , {desc = "fugitive 'git commit'"    })
map("n", "<leader>gs", "<cmd> Git<CR>"        , {desc = "fugitive"                 })
map("n", "<C-Up>"    , "# zz"                 , {desc = "find word above"          })
map("n", "<C-Down>"  , "* zz"                 , {desc = "find word below"          })
map("n", "<C-Right>" , "e"                    , {desc = "end of current word"      })
map("n", "<C-Left>"  , "b"                    , {desc = "begining of current word" })

function RunDotnetTest()

    local filename_without_ext = vim.fn.expand('%:t:r')
    local command = string.format('dotnet test --filter "%s"', filename_without_ext)
    vim.api.nvim_command('botright split | term ' .. command)

end

map("n", "<leader>dnt", ":lua RunDotnetTest()<CR>", {desc = "run dotnet test"})

-- Copilot
map(
  "i",
  "<C-]>",
  function()
    vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
  end,
  {
    desc = "Copilot accept",
    nowait = true,
    silent = true,
    expr = true,
  }
)

map(
  "i",
  "<C-\\>",
  "<Plug>(copilot-accept-word)",
  {
    desc = "Copilot accept word",
    nowait = true,
    silent = true,
    expr = true,
  }
)

map(
  "i",
  "<C-|>",
  "<Plug>(copilot-accept-line)",
  {
    desc = "Copilot accept line",
    nowait = true,
    silent = true,
    expr = true,
  }
)

map(
  "i",
  "<A-.>",
  "<Plug>(copilot-suggest)",
  {
    desc = "Copilot suggest",
    nowait = true,
    silent = true,
    expr = true,
  }
)

map(
  "i",
  "<A-Down>",
  "<Plug>(copilot-next)",
  {
    desc = "Copilot next",
    nowait = true,
    silent = true,
    expr = true,
  }
)

map(
  "i",
  "<A-Up>",
  "<Plug>(copilot-previous)",
  {
    desc = "Copilot previous",
    nowait = true,
    silent = true,
    expr = true,
  }
)
