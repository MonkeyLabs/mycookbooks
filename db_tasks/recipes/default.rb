#
# Cookbook Name:: db_tasks
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'run_migrate' do
  cwd '/srv/www/durman_qa/current'
  code <<-EOH
    bundle exec rake db:migrate;
    sleep 1;
    EOH
end


bash 'run_seed' do
  cwd '/srv/www/durman_qa/current'
  code <<-EOH
    bundle exec rake db:seed;
    sleep 1;
    EOH
end

bash 'run_precompile' do
  cwd '/srv/www/durman_qa/current'
  code <<-EOH
    bundle exec rake assets:precompile;
    sleep 1;
    EOH
end

