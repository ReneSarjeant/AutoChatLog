local addonName, addonTable = ...

-- Enable chat logging as soon as the player is in the world
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local function EnableChatLog()
    -- Only turn it on if it's not already on
    if not LoggingChat() then
        LoggingChat(true)
        print("|cff00ff00Auto Chat Log:|r Chat logging enabled. Log file: Logs\\WoWChatLog.txt")
    end
end

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" or event == "PLAYER_ENTERING_WORLD" then
        -- Small delay so the chat system is ready
        C_Timer.After(1, EnableChatLog)
    end
end)

-- Optional slash commands
SLASH_AUTOCHATLOG1 = "/autochatlog"
SLASH_AUTOCHATLOG2 = "/acl"

SlashCmdList["AUTOCHATLOG"] = function(msg)
    msg = string.lower(msg or "")
    if msg == "off" then
        LoggingChat(false)
        print("|cffff0000Auto Chat Log:|r Chat logging disabled.")
    elseif msg == "status" then
        if LoggingChat() then
            print("|cff00ff00Auto Chat Log:|r Currently logging.")
        else
            print("|cffff0000Auto Chat Log:|r Not logging.")
        end
    else
        LoggingChat(true)
        print("|cff00ff00Auto Chat Log:|r Chat logging enabled.")
    end
end
