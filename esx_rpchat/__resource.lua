resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Chat addon made by NS100'
author 'NS100#0001'

version '1.0.0'

client_script 'client/main.lua'

server_scripts {

  '@mysql-async/lib/MySQL.lua',
  'server/main.lua'

}

--any errors occur contact me via discord!
