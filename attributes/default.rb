default['sleepers']['ruby-version'] = "2.0.0-p353"
default['sleepers']['http_port'] = 80
default['sleepers']['https_port'] = 443
default['sleepers']['internal_port_base'] = 5000
default['sleepers']['home_dir'] = '/home'
default['sleepers']['root_dir'] = 'www/current'
default['sleepers']['public_dir'] = 'www/current/public'
default['sleepers']['pids_dir'] = 'www/shared/pids'
default['sleepers']['config_dir'] = 'www/shared/config'
default['sleepers']['nginx_log_dir'] = '/var/log/nginx'
default['sleepers']['nginx_vhosts_dir'] = ::File.join(node['nginx']['dir'], 'apps')
default['sleepers']['nginx_log_dir'] = ::File.join(node['nginx']['log_dir'], 'apps')
default['sleepers']['create_dirs'] = ['www', 'www/shared', 'www/shared/config', 'www/shared/pids']
default['sleepers']['app'] = {
    'domains'      => nil,
    'location'     => '/',
    'postgres'     => 'false',
    'pg_password'  => nil,
    'ssh_keys'     => [],
    'processes'    => {},
    'config_files' => {}
}
default['postgresql']['version'] = 9.3
default['ruby-build']['upgrade'] = 'sync'
default['authorization']['sudo']['include_sudoers_d'] = true
