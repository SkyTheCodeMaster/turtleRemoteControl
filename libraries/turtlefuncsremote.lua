local tf = {}

local function isOdd(n)
  if n % 2 == 1 then return true else return false end
end

function tf.move()
  if not turtle.forward() then
    if turtle.detect() then return false, "block in way" end
  else return false, "could not move" end
end

function tf.forward(nDistance)
  nDistance = nDistance or 1
  local bSuccess,sWhy
  for i=1,nDistance do
    bSuccess,sWhy = turtle.forward()
  end
  return bSuccess,sWhy
end

function tf.back(nDistance)
  nDistance = nDistance or 1
  local bSuccess,sWhy
  for i=1,nDistance do
    bSuccess,sWhy = turtle.back()
  end
  return bSuccess,sWhy
end

function tf.down(nDistance)
  nDistance = nDistance or 1
  local bSuccess,sWhy
  for i=1,nDistance do
    bSuccess,sWhy = turtle.down()
  end
  return bSuccess,sWhy
end

function tf.up(nDistance)
  nDistance = nDistance or 1
  local bSuccess,sWhy
  for i=1,nDistance do
    bSuccess,sWhy = turtle.up()
  end
  return bSuccess,sWhy
end

function tf.turnRight(nDistance)
  nDistance = nDistance or 1
  local bSuccess,sWhy
  for i=1,nDistance do
    bSuccess,sWhy = turtle.turnRight()
  end
  return bSuccess,sWhy
end

function tf.turnLeft(nDistance)
  nDistance = nDistance or 1
  local bSuccess,sWhy
  for i=1,nDistance do
    bSuccess,sWhy = turtle.turnLeft()
  end
  return bSuccess,sWhy
end

function tf.turnAround()
  local b1,s1 = tf.turnRight()
  local b2,s2 = tf.turnRight()
  return b1 and b2,s1,s2
end

function tf.strafeLeft(nDistance)
  nDistance = nDistance or 1
  local b1,s1 = tf.turnLeft()
  local b2,s2 = tf.forward(nDistance)
  local b3,s3 = tf.turnRight()
  return b1 and b2 and b3,s1,s2,s3
end

function tf.strafeRight(nDistance)
  nDistance = nDistance or 1
  local b1,s1 = tf.turnRight()
  local b2,s2 = tf.forward(nDistance)
  local b3,s3 = tf.turnLeft()
  return b1 and b2 and b3,s1,s2,s3
end

function tf.uTurnRight()
  turtle.turnRight()
  turtle.forward()
  turtle.turnRight()
end

function tf.uTurnLeft()
  turtle.turnLeft()
  turtle.forward()
  turtle.turnLeft()
end

return tf
