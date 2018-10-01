local event = {}
event.onInputUpdate = SimpleEvent:New("onUpdate")
event.onUpdate = SimpleEvent:New("onUpdate")
event.onAccSysUpdate = SimpleEvent:New("onAccSysUpdate")
event.onLateUpdate = SimpleEvent:New("onLateUpdate")
event.onCamDraw = SimpleEvent:New("onCamDraw")
event.resize = SimpleEvent:New("resize")
event.onDraw = SimpleEvent:New("onDraw")
event.onKeyPressed = SimpleEvent:New("onKeyPressed")
event.onDoShake = SimpleEvent:New("onDoShake")
return event