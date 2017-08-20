user 'node' do
  comment 'NodeJS user'
  system true
  shell '/bin/bash'
  home '/srv/node'
end


execute 'Change Permissions' do
    command 'chown -R node.node /srv/node'
    action :run
end


execute 'Install pm2' do
	command 'npm install -g pm2'
	action :run
end


execute 'Enabling PM2 Systemd unit file' do
	command 'pm2 startup -u node systemd'
	action :run
        ignore_failure true
end
