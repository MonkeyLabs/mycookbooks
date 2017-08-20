#AWS settings
app = search(:aws_opsworks_app).first

execute 'Install Modules' do
    command 'npm install'
    cwd "/srv/node/#{app['shortname']}"
    action :run
end

execute 'Install Modules Globally' do
    command 'npm install -g'
    cwd "/srv/node/#{app['shortname']}"
    action :run
end

execute 'Change Permissions' do
    command "chown -R node.node /srv/node/#{app['shortname']}"
    action :run
end
