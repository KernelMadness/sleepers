include_recipe "user"

node['sleepers']['apps'].each do |app, config|
  user_account app do
    system_user true
    shell '/bin/bash'
    ssh_keys config['ssh_keys']
  end
end

group 'rbenv' do
  members node['sleepers']['apps'].keys
end
