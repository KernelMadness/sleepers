include_recipe 'postgresql::server' if node['sleepers']['apps'].find {|app, params| params['postgres'] == 'true'}

node['sleepers']['apps'].each_with_index do |(app, params), index|
  if params['postgres'] == 'true'
    pw = params['pg_password'] || rand(36**16).to_s(36)
    db = "#{app}_production"
    pg_user app do
      privileges login: true
      password pw
    end

    pg_database db do
      owner app
    end

    node.default['sleepers']['apps'][app]['config_files']['database.yml'] = {
      'production' => {
        'adapter' => 'postgresql',
        'database'=> db,
        'host' => '127.0.0.1',
        'user' => app,
        'password' => pw
      }
    }
  end
end
