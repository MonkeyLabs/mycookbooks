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
    crontab -r;
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

bash 'run_seed' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec rake db:seed;
    sleep 1;
    EOH
end

#Nicaragua

bash 'run_migrate' do
  cwd '/srv/www/durmanonline_nicaragua/current'
  code <<-EOH
    bundle exec rake db:migrate;
    sleep 1;
    EOH
end


bash 'run_precompile' do
  cwd '/srv/www/durmanonline_nicaragua/current'
  code <<-EOH
    bundle exec rake assets:precompile;
    sleep 1;
    EOH
end

bash 'run_whenever' do
  cwd '/srv/www/durmanonline_nicaragua/current'
  code <<-EOH
    crontab -r;
    bundle exec whenever -s 'environment=production' --update-crontab;
    sleep 1;
    EOH
end

bash 'run_tmp_assets' do
  cwd '/srv/www/durmanonline_nicaragua/current/tmp'
  code <<-EOH
    chmod -R 777 .;
    sleep 1;
    EOH
end

bash 'run_seed' do
  cwd '/srv/www/durmanonline_nicaragua/current'
  code <<-EOH
    bundle exec rake db:seed;
    sleep 1;
    EOH
end
