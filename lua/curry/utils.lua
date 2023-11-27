M = {}

M.Foreach = function(tbl, f)
  for k, v in pairs(tbl) do
    f(k, v)
  end
end

return M
