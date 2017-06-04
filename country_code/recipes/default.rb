node[:deploy].each do |app, deploy|
  file File.join(deploy[:deploy_to], 'current', 'config', 'country_configuration.yml') do
    content YAML.dump(node[:dol_data][app].to_hash)
  end
end
