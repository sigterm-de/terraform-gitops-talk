-- Path to the filters directory
local filter_dir = "filters/"

-- Get a list of files in the `filters` directory
-- Use pandoc's system module to run `ls` (cross-platform compatible)
local output = pandoc.pipe("ls", { filter_dir }, "")

-- Iterate over each file and load `.lua` files
for file in output:gmatch("[^\r\n]+") do
  if file:match("%.lua$") then
    dofile(filter_dir .. file)
  end
end