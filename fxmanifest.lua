fx_version 'cerulean'
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'hdrp-fishmeat'
version '2.0.5'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
	'server/*.lua'
}

client_scripts {
    'client/*.lua'
}

dependencies {
    'rsg-core',
    'ox_lib',
}

files {
  'locales/*.json'
}


lua54 'yes'