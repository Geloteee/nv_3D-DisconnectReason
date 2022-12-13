Config = {}

Config.Translation = function(source, name, reason)
    return 'PLAYER ~b~[~y~'..source..'~b~] ~b~'..name..'~s~ HAS LEFT THE SERVER\n~o~REASON~s~: ~r~'..reason;
end

Config.Reasons = {
    ['timed out'] = 'Timed Out',
    ['crash'] = 'Crashed',
    ['Exiting'] = 'Quitted',
    ['Disconnected.'] = 'Disconnected',
}
