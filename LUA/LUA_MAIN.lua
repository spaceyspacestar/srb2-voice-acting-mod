freeslot("sfx_atak1", "sfx_atak2", "sfx_atak3", "sfx_bost1", "sfx_bost2", 
"sfx_bost3", "sfx_died1", "sfx_died2", "sfx_died3", "sfx_died4", "sfx_emmy1", 
"sfx_emmy2", "sfx_gring", "sfx_jping1", "sfx_jping2", "sfx_jping3", "sfx_jping4", 
"sfx_jping5", "sfx_jping6", "sfx_rloss1", "sfx_rloss2", "sfx_rloss3",
"sfx_rloss4", "sfx_rloss5", "sfx_rloss6", "sfx_schg1", "sfx_schg2", "sfx_schg3",
"sfx_schg4", "sfx_schg5", "sfx_srel1", "sfx_srel2", "sfx_srel3", "sfx_srel4",
"sfx_srel5", "sfx_star1", "sfx_star2", "sfx_star3", "sfx_star4", "sfx_tran1", 
"sfx_tran2", "sfx_tran3", "sfx_tran4", "sfx_scheck")

-- Set up a table for easy randomize (implemented in the shittest way possible)

--Bonus Enter
local bonusstartsnd = {[0] = 739, [1] = 740, [2] = 741}
--Death
local deathsnd = {[0] = 742, [1] = 743, [2] = 744, [3] = 745}
--Got emerald
local gotemmysnd = {[0] = 746, [1] = 747}
--Jumping
local jumpingsnd = {[0] = 749, [1] = 750, [2] = 751, [3] = 752, [4] = 753, 
[5] = 754}
--Ring loss
local ringLsnd = {[0] = 755, [1] = 756, [2] = 757, [3] = 758, [4] = 759,
[5] = 760}
--Spindash Charge
local spinchargesnd = {[0] = 761, [1] = 762, [2] = 763, [3] = 764, [4] = 765}
--Spindash Release
local spinreleasesnd = {[0] = 766, [1] = 767, [2] = 768, [3] = 769, [4] = 770}
--Start
local startingsnd = {[0] = 771, [1] = 772, [2] = 773, [3] = 774}
--Transformation
local transformsnd = {[0] = 775, [1] = 776, [2] = 777, [3] = 778}
local saytimer = 1000 * 3 //for spinning


addHook("PlayerSpawn", function(player)
	local mo = player.mo
	--Don't play if not sonic
	if not(mo and mo.valid and mo.skin == "sonic") return end
	S_StartSound(mo, P_RandomRange(startingsnd[0], startingsnd[3]))
end)

addHook("PlayerThink", function(player)
	local mo = player.mo
	if not(mo and mo.valid and mo.skin == "sonic") return end
	--SPINDASHING
	local spindashed = 1
	
	if player.pflags & PF_STARTDASH
		saytimer = $1 - TICRATE
	end
	if saytimer <= 0
		S_StartSound(mo, P_RandomRange(spinchargesnd[0], spinchargesnd[4]))
		saytimer = 1000 * 3
	end
end)

addHook("JumpSpecial", function(player)
	local mo = player.mo
	--make sure we don't make a sound when we can't jump or currently jumping
	if player.pflags & PF_JUMPSTASIS
	or player.pflags & PF_JUMPDOWN
	or mo.skin != "sonic"
	or not P_IsObjectOnGround(mo)
	return end
	P_DoJump(player, false)
	mo.state = S_PLAY_JUMP
	S_StartSound(mo, P_RandomRange(jumpingsnd[0], jumpingsnd[5]))
	end
, MT_PLAYER)


addHook("MobjDeath", function(mo)
	if mo and mo.valid and mo.skin == "sonic" 
	S_StartSound(mo, P_RandomRange(deathsnd[0], deathsnd[3]))
	end 
end
,MT_PLAYER)
