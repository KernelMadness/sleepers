include_recipe 'nginx' unless node['sleepers']['apps'].find {|app, params| params['domains'] == 'true'}.nil?

template ::File.join(node['nginx']['dir'], 'conf.d', 'sleepers.conf') do
  source 'nginx_sleepers.conf.erb'
end

directory node['sleepers']['nginx_vhosts_dir']
directory node['sleepers']['nginx_log_dir']

node['sleepers']['apps'].each_with_index do |(app, params), index|
  next if params['domains'].nil?

  options = {
    :server_name => params['domains'].join(' '),
    :root => public_dir(app),
    :access_log => access_log(app),
    :error_log => error_log(app),
    :upstream => 'http://127.0.0.1:' + app_port(index).to_s
  }

  template ::File.join(node['sleepers']['nginx_vhosts_dir'], app) do
    source 'vhost.conf.erb'
    variables(options)
    notifies :reload, 'service[nginx]'
  end
end

service 'nginx'
