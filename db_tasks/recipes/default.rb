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
    bundle exec rake db:migrate;
    sleep 1;
    EOH
end


bash 'run_precompile' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec rake assets:precompile;
    sleep 1;
    EOH
end

bash 'run_whenever' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec whenever -s 'environment=production' --update-crontab;
    sleep 1;
    EOH
end

bash 'run_tmp_assets' do
  cwd '/srv/www/granbazar/current/tmp'
  code <<-EOH
    chmod -R 777 .;
    sleep 1;
    EOH
end

bash 'run_link_uploads' do
  cwd '/srv/www/granbazar/current/tmp'
  code <<-EOH
    mkdir -p /srv/www/granbazar/uploads;
    rm -rd /srv/www/granbazar/current/public/uploads;
    ln -s /srv/www/granbazar/uploads /srv/www/granbazar/current/public/uploads;
    chmod -R 777 /srv/www/granbazar/uploads;
    sleep 1;
    EOH
end

bash 'run_public_uploads' do
  cwd '/srv/www/granbazar/current/public/uploads'
  code <<-EOH
    chmod -R 777 .;
    sleep 1;
    EOH
end

bash 'run_link_ftp' do
  cwd '/srv/www/granbazar/current/tmp'
  code <<-EOH
    ln -s /srv/uploads/ /srv/www/granbazar/current/public/account_status;
    sleep 1;
    EOH
end

bash 'run_seed' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec rake db:seed;
    sleep 1;
    EOH
end