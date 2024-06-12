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
    local pattern = '"([^"]+\\[^"]+%.csproj)"'
    local project_name = line:match(pattern)
    if project_name then
      file:close()
      return string.gsub(project_name, "\\", "/")
    end
  end

  file:close()
  return nil
end

return {
  find_project_path = find_project_path,
}
