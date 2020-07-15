script_author("Levsha1337")
script_name("sa-pc.online tazer")

local targeting = false
local target_id = -1

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(0)
    end
    
    sampAddChatMessage("Special for {ff4444}sa{ffffff}-{4444ff}pc{ffffff}.online by {4477aa}Levsha1337{ffffff}: tazer script", 0xFFFFFFFF)

    while true do
        wait(1)
        local result, ped = getCharPlayerIsTargeting(PLAYER_HANDLE)
        if result and not targeting then
            local result2, id = sampGetPlayerIdByCharHandle(ped)
            if result2 then
                local nickname = sampGetPlayerNickname(id)
                local score = sampGetPlayerScore(id)
                targeting = true
                target_id = id
            end
        elseif not result and targeting then
            targeting = false
        end

        if isKeyDown(17) and isKeyDown(66) and target_id ~= -1 then
            sampSendChat(string.format("/tazer %d", target_id))
            while isKeyDown(17) and isKeyDown(66) do
                wait(0)
            end
        end
    end
end