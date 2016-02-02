if SERVER then
	local ammo_types = {
		"pistol",		--Pistol and M16 ammo.
		"smg1",			--SMG ammo, used by MAC10 and UMP.
		"revolver",		--Desert eagle ammo.
		"357",			-- Sniper rifle ammo.
		"buckshot", 	-- Shotgun ammo.
		"AlyxGun"		--revolver
	}

	hook.Add("PlayerLoadout","grant_ammo", function(ply)
		for k,v in ipairs(ammo_types) do
			ply:GiveAmmo(60,v,true)
		end
	end)
end