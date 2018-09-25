local t1 = { name = " t1" }
local t2 = { name = " t2" }
local ta = t1
local tb = ta
ta = t2
print(tb.name)