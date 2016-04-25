-- helper function that we use to sort the multi bulk output of 
-- non-deterministic commands, when containing 'false' elements
function __redis__compare_helper(a,b)
  if a == false then a = '' end
  if b == false then b = '' end
  return a<b
end
