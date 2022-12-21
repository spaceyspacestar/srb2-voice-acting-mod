--Attacking
local attacksnd = {[0] = 736, [1] = 737, [2] = 738}
--Got Ring
local gotringsnd = 748 //needs a variable of its own because consistency lmfao

local hitdetection = function(mobj, mo)
	local player = mo and mo.valid and mo.skin == "sonic" and mo.player
	if not(player) return end
	S_StartSound(mo, P_RandomRange(attacksnd[0], attacksnd[2]))
end

--I got a ring lol
local gotaring = function(mobj, mo)
	local player = mo and mo.valid and mo.skin == "sonic" and mo.player
	if not(player) return end
	S_StartSound(mo, gotringsnd)
end

addHook("MobjCollide", gotaring, MT_RING)

--Oh boy the enemies
addHook("MobjDamage", hitdetection, MT_BLUECRAWLA)
addHook("MobjDamage", hitdetection, MT_REDCRAWLA)
addHook("MobjDamage", hitdetection, MT_GFZFISH)
addHook("MobjDamage", hitdetection, MT_GOLDBUZZ)
addHook("MobjDamage", hitdetection, MT_REDBUZZ)
addHook("MobjDamage", hitdetection, MT_JETTBOMBER)
addHook("MobjDamage", hitdetection, MT_JETTGUNNER)
addHook("MobjDamage", hitdetection, MT_CRAWLACOMMANDER)
addHook("MobjDamage", hitdetection, MT_DETON)
addHook("MobjDamage", hitdetection, MT_SKIM)
addHook("MobjDamage", hitdetection, MT_TURRET)
addHook("MobjDamage", hitdetection, MT_POPUPTURRET)
addHook("MobjDamage", hitdetection, MT_SPINCUSHION)
addHook("MobjDamage", hitdetection, MT_CRUSHSTACEAN)
addHook("MobjDamage", hitdetection, MT_BANPYURA)
addHook("MobjDamage", hitdetection, MT_JETJAW)
addHook("MobjDamage", hitdetection, MT_SNAILER)
addHook("MobjDamage", hitdetection, MT_VULTURE)
addHook("MobjDamage", hitdetection, MT_POINTY)
addHook("MobjDamage", hitdetection, MT_ROBOHOOD)
addHook("MobjDamage", hitdetection, MT_FACESTABBER)
addHook("MobjDamage", hitdetection, MT_EGGGUARD)
addHook("MobjDamage", hitdetection, MT_GSNAPPER)
addHook("MobjDamage", hitdetection, MT_MINUS)
addHook("MobjDamage", hitdetection, MT_UNIDUS)
addHook("MobjDamage", hitdetection, MT_CANARIVORE)
addHook("MobjDamage", hitdetection, MT_PYREFLY)
addHook("MobjDamage", hitdetection, MT_PTERABYTE)
addHook("MobjDamage", hitdetection, MT_DRAGONBOMBER)