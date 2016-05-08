#
# Cookbook Name:: sap_vpn
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/vpnc/SAP.conf" do
  source "SAP.conf"
  mode "0644"
end

cookbook_file "/etc/init/vpnc.conf" do
  source "vpnc.conf"
  mode "0644"
end

execute "sleep 5"

execute "start vpnc"

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