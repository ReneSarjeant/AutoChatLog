-- Enable the client's built-in chat logger whenever the player enters the world.
-- PLAYER_ENTERING_WORLD covers login, UI reloads, and zone transitions.
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local function EnableChatLog()
    if not LoggingChat() then
        LoggingChat(true)
        print("|cff00ff00Auto Chat Log:|r Chat logging enabled. Log file: Logs\\WoWChatLog.txt")
    end
end

frame:SetScript("OnEvent", EnableChatLog)

SLASH_AUTOCHATLOG1 = "/autochatlog"
SLASH_AUTOCHATLOG2 = "/acl"

SlashCmdList["AUTOCHATLOG"] = function(msg)
    msg = string.lower((msg or ""):match("^%s*(.-)%s*$"))
    if msg == "status" then
        if LoggingChat() then
            print("|cff00ff00Auto Chat Log:|r Currently logging.")
        else
            print("|cffff0000Auto Chat Log:|r Not logging.")
        end
    else
        EnableChatLog()
    end
end
