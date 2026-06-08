--[[
    This file is part of the MapleQuestAdvisor planning tool
    Copyleft (L) 2020 - 2021 RonanLana

    GNU General Public License v3.0

    Permissions of this strong copyleft license are conditioned on making available complete
    source code of licensed works and modifications, which include larger works using a licensed
    work, under the same license. Copyright and license notices must be preserved. Contributors
    provide an express grant of patent rights.
--]]

local http = require("socket.http")

local sServiceUserdataUrl = "http://localhost:8080/MQA-Service/api/userdata/"

REndpoint = {
    QUEST = "quest",
    INVENTORY = "inventory",
    CHARACTER = "character",
    RATES = "rates"
}

local function requests_get(sEndpoint, tOpts)
    local sUrl = sServiceUserdataUrl .. sEndpoint
    print("Fetching '" .. sUrl .. "'")

    -- Fetch the JSON string response from the server
    local response_body, status_code = http.request(sUrl)

    if status_code == 200 and response_body then
        return response_body
    else
        print("    [ERROR " .. status_code .. "] Setting default values for this request.")
        print()

        return nil
    end
end

function requests_get_character(iCid)
    local resp = requests_get(REndpoint.CHARACTER .. "/" .. tostring(iCid), {})
    if resp == nil then
        resp = "id, name, job, level, exp, map, meso, fame, gender\n1,IOTechKnight,122,77,0,100000000,0,0,0"
    end

    return resp
end

function requests_get_inventory(iCid)
    local resp = requests_get(REndpoint.INVENTORY .. "/" .. tostring(iCid), {})
    if resp == nil then
        resp = "itemid, quantity"
    end

    return resp
end

function requests_get_quest(iCid)
    local resp = requests_get(REndpoint.QUEST .. "/" .. tostring(iCid), {})
    if resp == nil then
        resp = "questid,state"
    end

    return resp
end

function requests_get_rates()
    local resp = requests_get(REndpoint.RATES, {})
    if resp == nil then
        resp = "exp,meso,drop\n1,1,1"
    end

    return resp
end
