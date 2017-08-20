cookbook_file '/tmp/setup_7.x' do
    source 'setup_7.x'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

bash 'Adding Node repo information' do
    code "/tmp/setup_7.x"
end

apt_update 'refresh' do
  action :update
end

apt_package 'nodejs' do
  action :install
end

apt_package 'nginx' do
  action :install
end
