--[[
    This file is part of the MapleQuestAdvisor planning tool
    Copyleft (L) 2020 - 2021 RonanLana

    GNU General Public License v3.0

    Permissions of this strong copyleft license are conditioned on making available complete
    source code of licensed works and modifications, which include larger works using a licensed
    work, under the same license. Copyright and license notices must be preserved. Contributors
    provide an express grant of patent rights.
--]]

sServiceUserdataUrl = "http://localhost:8080/MQA-Service/api/userdata/"

REndpoint = {
    QUEST = "quest",
    INVENTORY = "inventory",
    CHARACTER = "character",
    RATES = "rates"
}

local function requests_get(sEndpoint, tOpts)
    local pResp, pErr = requests.request("GET", sServiceUserdataUrl .. "/" .. sEndpoint, tOpts)
    local sBody = pResp:body()

    return sBody
end

function requests_get_character(iCid)
    return requests_get(REndpoint.CHARACTER .. "/" .. iCid, {})
end

function requests_get_inventory(iCid)
    return requests_get(REndpoint.INVENTORY .. "/" .. iCid, {})
end

function requests_get_quest(iCid)
    return requests_get(REndpoint.QUEST .. "/" .. iCid, {})
end

function requests_get_rates()
    return requests_get(REndpoint.RATES, {})
end
