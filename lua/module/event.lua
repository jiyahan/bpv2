local event = {}
event.onCmdUpdate = SimpleEvent:New("onCmdUpdate")
event.onPhysicsUpdate = SimpleEvent:New("onPhysicsUpdate")
event.onNextPosUpdate = SimpleEvent:New("onNextPosUpdate")
event.onLateUpdate = SimpleEvent:New("onLateUpdate")
event.onCamDraw = SimpleEvent:New("onCamDraw")
event.resize = SimpleEvent:New("resize")
event.onDraw = SimpleEvent:New("onDraw")
event.onKeyPressed = SimpleEvent:New("onKeyPressed")
event.onDoShake = SimpleEvent:New("onDoShake")
return event