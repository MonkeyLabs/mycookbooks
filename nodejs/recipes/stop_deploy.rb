#AWS settings
app = search(:aws_opsworks_app).first

execute 'Stop application' do
    command "pm2 stop #{app['shortname']}"
    action :run
    user 'node'
    cwd "/srv/node/#{app['shortname']}"
    environment 'PM2_HOME' => "/srv/node/.pm2"
    ignore_failure true
end

#directory "/srv/node/#{app['shortname']}" do
#  recursive true
#  action :delete
#  ignore_failure true
#end
