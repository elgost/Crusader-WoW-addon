local frame = CreateFrame("Frame")

-- Name of the buff (important!)
local BUFF_NAME = "Holy Strength"

frame:RegisterEvent("UNIT_AURA")

frame:SetScript("OnEvent", function(self, event, unit)
    if unit ~= "player" then return end

    for i = 1, 40 do
        local name = UnitBuff("player", i)
        if not name then break end

        if name == BUFF_NAME then
            PlaySoundFile("Interface\\AddOns\\CrusaderProcAlert\\crusader.mp3", "Master")
            return
        end
    end
end)
