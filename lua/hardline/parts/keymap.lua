local opt = vim.opt

local function get_item()
  local km = opt.iminsert
  if km:get() == 1 then
    return "RU"
  end
  return "EN"
end

return {
  get_item = get_item,
}
