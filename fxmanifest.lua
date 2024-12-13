fx_version 'bodacious'
game 'gta5'
lua54 'yes'

name "sc_phonetax"
author "Scube Scripts"
version "1.0.1"
description "The script adds mobile phone bill to the game."

server_scripts {
	'server/server.lua',
	'server/updater.lua'
}

client_scripts {
	'client/client.lua'
}

shared_script {
	'@ox_lib/init.lua',
	'config.lua'
  }