--Define o comando /manager. TODO Testar sem colocar SLASH_ e com nomes variados.
SLASH_MANAGER1 = "/manager"
--Adiciona o comando na lista de comandos do jogo. TODO Por que MANAGER � adicionado e n�o SLASH_MANAGER1?
SlashCmdList["MANAGER"] = function(msg, editbox)
--O argumento passado � o msg.
	if msg == "on" then
		PlayerFrame:RegisterEvent("UNIT_COMBAT")
		FEM_combat = true
	elseif msg == "off" then
		PlayerFrame:UnregisterEvent("UNIT_COMBAT")
		FEM_combat = false
	else
		print("Comando invalido.")
	end
end

local base = CreateFrame("Frame")

--Este m�todo � como um listener. Sempre que o evento acontecer, OnEvent ser� chamado.
base:RegisterEvent("ADDON_LOADED")
--Como "OnEvent" foi definido, este bloco acontecer� sempre que o evento da linha anterior ocorrer.
base:SetScript("OnEvent", function (self, event, name)
	if name == "FrameEventManager" then
		if FEM_combat == nil then
			FEM_combat = true
		elseif FEM_combat == true then
			PlayerFrame:RegisterEvent("UNIT_COMBAT")
		else
			PlayerFrame:UnregisterEvent("UNIT_COMBAT")
		end
	end
end)