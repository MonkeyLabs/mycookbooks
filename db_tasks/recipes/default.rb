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

bash 'run_tmp_assets' do
  cwd '/srv/www/durman_qa/current/tmp'
  code <<-EOH
    chmod -R 777 .;
    sleep 1;
    EOH
end

bash 'run_link_uploads' do
  cwd '/srv/www/durman_qa/current/tmp'
  code <<-EOH
    rm -rd /srv/www/durman_qa/current/public/uploads;
    ln -s /srv/www/durman_qa/uploads /srv/www/durman_qa/current/public/uploads;
    sleep 1;
    EOH
end

bash 'run_public_uploads' do
  cwd '/srv/www/durman_qa/current/public/uploads'
  code <<-EOH
    chmod -R 777 .;
    sleep 1;
    EOH
end

bash 'run_precompile' do
  cwd '/srv/www/durman_qa/current/tmp'
  code <<-EOH
    ln -s /home/uploads/ /srv/www/durman_qa/current/public/account_status;
    sleep 1;
    EOH
end