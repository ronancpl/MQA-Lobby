--[[
    This file is part of the MapleQuestAdvisor planning tool
    Copyleft (L) 2020 - 2021 RonanLana

    GNU General Public License v3.0

    Permissions of this strong copyleft license are conditioned on making available complete
    source code of licensed works and modifications, which include larger works using a licensed
    work, under the same license. Copyright and license notices must be preserved. Contributors
    provide an express grant of patent rights.
--]]

RPath = {
    USERDATA_CSV = "..\\..\\MapleQuestAdvisor\\lib\\userdata\\"
}

function write_io_csv(sFileName, sStr)
    local fOut = io.open(RPath.USERDATA_CSV .. sFileName, "w")
    if fOut ~= nil then
        fOut:write(sStr)
        io.close(fOut)
    end
end
