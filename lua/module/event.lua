local event = {}
event.onCamDraw = SimpleEvent:New("onCamDraw")
event.resize = SimpleEvent:New("resize")
event.onDraw = SimpleEvent:New("onDraw")
event.onUpdate = SimpleEvent:New("onUpdate")
event.onLateUpdate = SimpleEvent:New("onLateUpdate")
event.onKeyPressed = SimpleEvent:New("onKeyPressed")
event.onDoShake = SimpleEvent:New("onDoShake")
return event