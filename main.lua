local tf = require("libraries.turtlefuncsremote")
local modem = peripheral.find("modem")

local data = {
  channel = 27795,
  id = os.getComputerID()
}

modem.open(data.channel)

local rtnTable,message,sender,reply = {},{},0,0

while true do
  repeat  _,_,sender,reply,message = os.pullEvent("modem_message")
  until sender == data.channel and type(message) == "table" and message[1] == data.id

  for i=1,#message-1 do
    local cmd = message[i+1]
    if cmd[1] == "forward" then
      rtnTable[i] = {tf.forward(cmd[2])}
    elseif cmd[1] == "back" then
      rtnTable[i] = {tf.back(cmd[2])}
    elseif cmd[1] == "turnRight" then
      rtnTable[i] = {tf.turnRight(cmd[2])}
    elseif cmd[1] == "turnLeft" then
      rtnTable[i] = {tf.turnLeft(cmd[2])}
    elseif cmd[1] == "up" then
      rtnTable[i] = {tf.up(cmd[2])}
    elseif cmd[1] == "down" then
      rtnTable[i] = {tf.down(cmd[2])}
    elseif cmd[1] == "strafeLeft" then
      rtnTable[i] = {tf.strafeLeft(cmd[2])}
    elseif cmd[1] == "strafeRight" then
      rtnTable[i] = {tf.strafeRight(cmd[2])}
    elseif cmd[1] == "turnAround" then
      rtnTable[i] = {tf.turnAround(cmd[2])}
    elseif cmd[1] == "uTurnLeft" then
      rtnTable[i] = {tf.uTurnLeft(cmd[2])}
    elseif cmd[1] == "uTurnRight" then
      rtnTable[i] = {tf.uTurnRight(cmd[2])}    
    end
  end
  modem.transmit(reply,sender,rtnTable)e
end
