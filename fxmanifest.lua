fx_version "cerulean"
use_fxv2_oal "yes"
lua54 "yes"
game "gta5"
version "1.0.0"
description "A simple moneywash system"
name 'krs_moneywash'
author "karos7804"

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_scripts {	
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

files {
    'locales/*.json'
}

dependencies {
	'ox_lib',
	'ox_inventory'
}
