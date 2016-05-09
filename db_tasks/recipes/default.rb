#
# Cookbook Name:: db_tasks
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

ruby_block "insert_line_1" do
  block do
    file = Chef::Util::FileEdit.new("/etc/hosts")
    file.insert_line_if_no_match("/192.168.200.20 cidrd00.alila.aliaxisla.com/", "192.168.200.20 cidrd00.alila.aliaxisla.com")
    file.write_file
  end
end

ruby_block "insert_line_2" do
  block do
    file = Chef::Util::FileEdit.new("/etc/hosts")
    file.insert_line_if_no_match("/192.168.200.21 cidrq01.alila.aliaxisla.com/", "192.168.200.21 cidrq01.alila.aliaxisla.com")
    file.write_file
  end
end

bash 'run_migrate' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec rake db:migrate
    EOH
end


bash 'run_seed' do
  cwd '/srv/www/granbazar/current'
  code <<-EOH
    bundle exec rake db:seed
    EOH
end

