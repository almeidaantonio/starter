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

local dotwrapper = require("configs.dotwrapper")

local dotnet_project = dotwrapper.find_project_path()

if dotnet_project then

  local run_on_term = function(comando)

    print("Running:", comando)

    vim.cmd("split")
    vim.cmd("enew")  -- Cria um novo buffer
    vim.cmd("term " .. comando)  -- Executa o comando no terminal
    vim.cmd("startinsert")  -- Entra no modo de inserção no terminal

  end

  local dotrun_command = "dotnet run --project "..dotnet_project

  map(
    "n",
    "<leader>dnb",

    function ()
      run_on_term("dotnet build")
    end,
    {
      desc = "dotnet - Compila o projeto atual",
    }
  )

  map(
    "n",
    "<leader>dnr",
    function ()
      run_on_term(dotrun_command)
    end,
    {
      desc = "dotnet - Executa o projeto fonte",
    }
  )

  map(
    "n",
    "<leader>dna",
    ":!dotnet add package ",
    {
      desc = "dotnet - Adiciona um pacote NuGet",
    }
  )

  map(
    "n",
    "<leader>dnt",
    function ()
      run_on_term("dotnet test")
    end,
    {
      desc = "dotnet - Roda testes do projeto"
    }
  )

  map(
    "n",
    "<leader>dnc",
    function ()
      run_on_term("dotnet clean")
    end,
    {
      desc = "dotnet - Remove binários e arquivos temporários do projeto"
    }
  )

end
