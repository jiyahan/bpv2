
local test={}
function test.f5()
    local hero = heroMgr:get()
    hero:removeComponent(BulletAttack)
    hero:addComponent(NearAttack)
end

function test.f6()
    local hero = heroMgr:get()
    hero:removeComponent(NearAttack)
    hero:addComponent(BulletAttack)
end

function test.f7()
    print(string.format("memory:%dkb", collectgarbage("count")))
end
return test