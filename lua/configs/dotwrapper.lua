local map = vim.keymap.set

local find_project_path = function ()

  local handle = io.popen("find . -type f -name '*.sln'")

  if handle == nil then
    return nil
  end

  local result = handle:read("*a")

  handle:close()

  if result == "" then
    return nil
  end

  local sln_file = result:gsub("%s+", "") -- Remove whitespace

  local file = io.open(sln_file, "r")

  if not file then
    return nil
  end

  for line in file:lines() do
    local pattern = '"([^"]+%.csproj)"'
    local project_name = line:match(pattern)
    if project_name then
      file:close()
      return string.gsub(project_name, "\\", "/")
    end
  end

  file:close()
  return nil
end

local run_on_term = function(comando)

  print("Running:", comando)

  vim.cmd("split")
  vim.cmd("enew")
  vim.cmd("term " .. comando)
  vim.cmd("startinsert")

end

local map_keys = function (dotnet_project)

  print("Dotnet project found:", dotnet_project)

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

return {
  setup = function ()
    local dotnet_project = find_project_path()
    if dotnet_project then
      map_keys(dotnet_project)
    end
  end,
}
