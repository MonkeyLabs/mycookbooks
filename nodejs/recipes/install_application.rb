#AWS settings
app = search(:aws_opsworks_app).first

directory "/srv/node/#{app['shortname']}" do
  owner 'node'
  group 'node'
  mode '0755'
  action :create
  recursive true  
end

application "/srv/node/#{app['shortname']}" do
    action_on_update false    
  git app['app_source']['url'] do
    deploy_key app['app_source']['ssh_key']
    revision app['app_source']['revision']
    action :sync
  end
end
