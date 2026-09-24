local Players = game:GetService("Players")

-- BANEAR a un jugador por nombre (solo servidor)
local function banPlayer(playerName, reason)
	local player = Players:FindFirstChild(playerName)
	if player then
		player:Kick(reason or "Has sido baneado de este juego.")
		-- Aqui puedes guardar el ban en DataStore para que sea permanente
		return true
	end
	return false
end

-- Ejemplo de uso:
-- banPlayer("NombreJugador", "Razon del ban")

-- Para banear automaticamente a jugadores baneados cuando entran:
local bannedUsers = {
	-- ["UserId"] = "razon del ban",
	["12345678"] = "Toxicidad",
}

Players.PlayerAdded:Connect(function(player)
	local banReason = bannedUsers[tostring(player.UserId)]
	if banReason then
		player:Kick("Baneado: " .. banReason)
	end
end)
