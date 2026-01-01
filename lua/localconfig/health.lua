local M = {}

local function check_tools()
  vim.health.start('tools')
  if vim.fn.executable('git') then
    vim.health.ok('git binary present')
  else
    vim.health.error('git binary missing')
  end
end


M.check = function()
  check_tools()
end

return M
