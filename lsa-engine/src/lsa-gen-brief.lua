BriefGenerator = {}

function BriefGenerator.generate()
    local red = BriefGenerator.getBrief("red")
    local blue = BriefGenerator.getBrief("blue")

    Log.debug(red)
    Log.debug(blue)
end

function BriefGenerator.getBrief(side)
    local carrierFreqs = BriefGenerator.getCarrierFreqs()

    local brief = "\n"

    for carrierName, carrierFreq in pairs(carrierFreqs) do
        if carrierFreq.side == side then
            brief = brief .. string.format("%s:\n", carrierName)
            for _, text in ipairs(carrierFreq.rows) do
                brief = brief .. string.format("%s\n", text)
            end
        end
    end

    -- local tankerFreqs = BriefGenerator.getTankerFreqs()
    -- for tankerName, tankerFreq in pairs(tankerFreqs) do
    --     if tankerFreq.side == side then
    --         brief = brief .. string.format("%s:\n", tankerName)
    --         for _, text in ipairs(tankerFreq.rows) do
    --             brief = brief .. string.format("%s\n", text)
    --         end
    --     end
    -- end

    return brief
end

-- function BriefGenerator.getTankerFreqs()
--     local bulletin = {}
--     local tankerTemplates = Templates.tankers

--     for _, tankerTemplate in ipairs(tankerTemplates) do
--         for _, template in ipairs(tankerTemplate.statics) do
--             if template.role == "tanker" then
--                 local mhz = BriefGenerator.toMhz(template.freq)
--                 local radio = string.format("%s: %s", mhz, template.modulation)
--                 local tacan = string.format("Tacan: %s %s%s", command.name, command.args.callsign, command.args.channel,
--                             command.args.modeChannel)
--             end
--         end
--     end
-- end

function BriefGenerator.getCarrierFreqs()
    local carrierTemplates = Templates.carriers

    local bulletin = {}
    for _, airbase in pairs(world.getAirbases()) do
        local airbaseType = airbase:getDesc().category
        if airbaseType == Airbase.Category.SHIP then
            local carrier = airbase:getUnit(1):getGroup():getUnit(1)
            local carrierName = carrier:getName()
            if airbase:getName() == carrierName then
                local side = LSA.side(airbase:getCoalition())
                local carrierType = carrier:getTypeName()
                local carrierTemplate = carrierTemplates[side][carrierType].vessels[1]
                local carrierCommands = carrierTemplates[side][carrierType].commands

                local mhz = BriefGenerator.toMhz(carrierTemplate.freq)
                local text = string.format("%s: %s", mhz, carrierTemplate.modulation)
                bulletin[carrierName] = {
                    side = side,
                    rows = {}
                }
                table.insert(bulletin[carrierName].rows, text)

                if carrierCommands ~= nil then
                    for _, command in ipairs(carrierCommands) do
                        local text = string.format("%s: %s %s%s", command.name, command.args.callsign, command.args.channel,
                            command.args.modeChannel)
                        table.insert(bulletin[carrierName].rows, text)
                    end
                end
            end
        end
    end
    return bulletin
end

function BriefGenerator.toMhz(hz)
    local mhz = hz / 1000000
    local text = string.format("%s MHz", mhz)
    return text
end