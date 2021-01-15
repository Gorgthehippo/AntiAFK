local M = {}
print("AntiAFK Initialising...")

local afkTimer = 0
local timer = 0

local lastPos = nil

local function onUpdate(deltaTime)
  timer = timer + deltaTime
  if timer >= 1 then
    timer = 0
    for i = 0, be:getObjectCount() do
      local veh = getVehicleID
      if isOwn(gameVehicleID) then
        local pos = veh:getPosition()
        local xOffset = math.abs(lastPos.x - pos)
        local yOffset = math.abs(lastPos.y - pos)
        local zOffset = math.abs(lastPos.z - pos)
        if xOffset > 0.001 or yOffset > 0.001 or xOffset > 0.001 then
          lastPos = pos
          afkTimer = 0
        else
           afkTimer = afkTimer + deltaTime
          -- if afkTimer > 300 then
          -- need to dissconect client from server on the server side and send kick message as afk
        --   end
        end

      end
    end
  end
end


M.onUpdate = onUpdate
return M;
