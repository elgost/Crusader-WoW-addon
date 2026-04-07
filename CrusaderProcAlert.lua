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

-- =========================
-- GUI PANEL
-- =========================
local panel = CreateFrame("Frame", addonName .. "OptionsPanel")
panel.name = "Crusader Proc Alert"

-- Title
local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("Crusader Proc Alert")

-- Checkbox
local checkbox = CreateFrame("CheckButton", addonName .. "CheckButton", panel, "InterfaceOptionsCheckButtonTemplate")
checkbox:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
checkbox.Text:SetText("Enable sound alert")

checkbox:SetScript("OnClick", function(self)
    CrusaderProcAlertDB.enabled = self:GetChecked()
end)

-- Sync checkbox when opening panel
panel:SetScript("OnShow", function()
    checkbox:SetChecked(CrusaderProcAlertDB.enabled)
end)

-- Add to Interface Options
InterfaceOptions_AddCategory(panel)
