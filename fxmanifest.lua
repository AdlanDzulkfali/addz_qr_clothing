fx_version 'adamant'
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 'AddZodus#6269'
description 'addz_qr_clothing by addzodus'
version '1.2.0'

ui_page 'ui/index.html'

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/server.lua',
  'config.lua'
}

client_scripts {
  'client/client.lua',
  'config.lua'
}

dependencies {
	'qr-clothes',
}