#
# Cookbook Name:: db_tasks
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'run_migrate' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec rake db:migrate RAILS_ENV=production
    EOH
end


bash 'run_seed' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec rake db:seed RAILS_ENV=production
    EOH
end

bash 'run_precompile' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec rake assets:precompile RAILS_ENV=production
    EOH
end

