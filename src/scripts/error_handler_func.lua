-- a helper function we use for pcall error reporting.
-- Note that when the error is in the C function we want to report the
-- information about the caller, that's what makes sense from the point
-- of view of the user debugging a script.
local dbg = debug
function __redis__err__handler(err)
  local i = dbg.getinfo(2,'nSl')
  if i and i.what == 'C' then
    i = dbg.getinfo(3,'nSl')
  end
  if i then
    return i.source .. ':' .. i.currentline .. ': ' .. err
  else
    return err
  end
end
