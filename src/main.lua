--[[
    This file is part of the MapleQuestAdvisor planning tool
    Copyleft (L) 2020 - 2021 RonanLana

    GNU General Public License v3.0

    Permissions of this strong copyleft license are conditioned on making available complete
    source code of licensed works and modifications, which include larger works using a licensed
    work, under the same license. Copyright and license notices must be preserved. Contributors
    provide an express grant of patent rights.
--]]

package.path = package.path .. ';?.lua'

require("csv")
require("listener")

local function make_dir_player_userdata()
    iResp = os.execute("mkdir " .. RPath.USERDATA_CSV)
    if iResp ~= 0 then
        -- do nothing
    end
end

local function requests_get_player_userdata(iCid)
    write_io_csv("character.csv", requests_get_character(iCid))
    write_io_csv("inventory.csv", requests_get_inventory(iCid))
    write_io_csv("quest.csv", requests_get_quest(iCid))
    write_io_csv("rates.csv", requests_get_rates())
end

make_dir_player_userdata()
requests_get_player_userdata(1)
