include_recipe "user"

node['sleepers']['apps'].each do |app, config|
  user_account app do
    system_user true
    shell '/bin/bash'
    ssh_keys config['ssh_keys']
  end

  link ::File.join(node['user']['home_root'], app, '.ruby') do
    to ::File.join(node['ruby_build']['default_ruby_base_path'], node['sleepers']['ruby-version'])
  end
end

group 'sleepers' do
  members node['sleepers']['apps'].keys
end
