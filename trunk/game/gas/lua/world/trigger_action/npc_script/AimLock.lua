local function Script(Arg, Trigger, Player)

	local NpcCamp = Trigger:CppGetCamp()
	local CreatorID = Trigger.m_CreatorEntityID
	local Creator = nil
	local CreatorCamp = nil 	
	if CreatorID ~= nil then
		Creator = CEntityServerManager_GetEntityByID(CreatorID)
	end
	if Creator ~= nil and IsCppBound(Creator) and IsNpc(Creator) then
		CreatorCamp = Creator:CppGetCamp() 
	end

	local OwnerID = Trigger.m_OwnerId
	local Owner = nil 
	local OwnerCamp = nil	
	if OwnerID ~= nil then 
		Owner = g_GetPlayerInfo(OwnerID)
	end
	if Owner ~= nil then
		OwnerCamp = Owner:CppGetCamp()
	end
	
	if Creator ~= nil and NpcCamp ~= CreatorCamp then
		Trigger:OnBeAttacked(CreatorID)		--NPC  攻击直接创建者
		return
	end
	
	if Owner ~= nil and NpcCamp ~= OwnerCamp then
		Trigger:OnBeAttacked(Owner:GetEntityID()) -- 攻击间接创建者
		return
	end
	
end

return Script