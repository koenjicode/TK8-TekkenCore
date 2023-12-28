local UEHelpers = require("UEHelpers")

-- LUA SETTINGS #START
toggleKeyBind = Key.F7 -- The key that's pressed to toggle your hud!
battleHudOpacity = 0 -- Edits the opacity of the hud.

-- LUA SETTINGS #END

function AdjustHud()
    tk8_hudPlayer = FindFirstOf("WBP_UI_HUD_C")
    if not tk8_hudPlayer:IsValid() then
        print("Hud Widget not found")
        return
    end

    canvas = tk8_hudPlayer.CanvasPanel_277
    if not canvas:IsValid() then
        print("Canvas Panel not found")
        return
    end

    canvas:SetRenderOpacity(battleHudOpacity)

    print("HUD Opacity updated")
end

RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context, NewPawn)
    ExecuteWithDelay(2000, function()
        AdjustHud()
    end)
end)


RegisterKeyBind(toggleKeyBind, AdjustHud)