#AWS settings
app = search(:aws_opsworks_app).first

execute 'Start or Redeploy if necesary' do
    command "pm2 start -u node --name #{app['shortname']}  #{node['instance']['startup_file']} -i #{node['instance']['count']}  --max-memory-restart #{node['instance']['memory_limit']}"
    action :run
    user 'node'
    cwd "/srv/node/#{app['shortname']}"
    environment 'PM2_HOME' => "/srv/node/.pm2"
end




