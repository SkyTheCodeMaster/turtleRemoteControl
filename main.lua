local queue = {}
local channel = 27795
local replyChannel = math.random(50000,60000)
local modem = peripheral.find("modem")
if modem == nil then error("Modem not found!") end

local control = {}

--[[
  By default, calling these functions will add them to the queue, which is then sent to the specified turtle. 
  If `true` is passed as the third argument, the command will be sent to the turtle immediately.
]]

function control.sendQueue(id)
  modem.transmit(channel,0,queue)
end

function control.sendQueueAndWait(id)
  modem.transmit(channel,replyChannel,queue)
  local message
  repeat _,_,sC,_,message = os.pullEvent("modem_message")
  until sC == channel and type(message) == "table"
  return message
end

function control.forward(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"forward",dist}})
  else
    queue[#queue + 1] = {"forward",dist}
  end
end

function control.back(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"back",dist}})
  else
    queue[#queue + 1] = {"back",dist}
  end
end

function control.turnLeft(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"turnLeft",dist}})
  else
    queue[#queue + 1] = {"turnLeft",dist}
  end
end

function control.turnRight(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"turnRight",dist}})
  else
    queue[#queue + 1] = {"turnRight",dist}
  end
end

function control.up(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"up",dist}})
  else
    queue[#queue + 1] = {"up",dist}
  end
end
  
function control.down(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"down",dist}})
  else
    queue[#queue + 1] = {"down",dist}
  end
end

function control.strafeLeft(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"strafeLeft",dist}})
  else
    queue[#queue + 1] = {"strafeLeft",dist}
  end
end

function control.strafeRight(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"strafeRight",dist}})
  else
    queue[#queue + 1] = {"strafeRight",dist}
  end
end

function control.turnAround(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"turnAround",dist}})
  else
    queue[#queue + 1] = {"turnAround",dist}
  end
end

function control.uTurnLeft(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{id,{"uTurnLeft",dist}})
  else
    queue[#queue + 1] = {"uTurnLeft",dist}
  end
end

function control.uTurnRight(dist,id,now)
  dist = dist or 1
  if now then
    modem.transmit(channel,0,{"uTurnRight",dist}})
  else
    queue[#queue + 1] = {"uTurnRight",dist}
  end
end

return control
