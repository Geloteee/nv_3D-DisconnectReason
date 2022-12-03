fx_version('cerulean')

games({ 'gta5' })

shared_scripts({
    'config.lua',
})

server_scripts({
    'server/**.lua',
});

client_scripts({
    'client/**.lua',
});