node['sleepers']['apps'].each_with_index do |(app, params), index|
  node['sleepers']['create_dirs'].each do |dir|
    directory app_dir(app, dir) do
      owner app
      group app
    end
  end

  params['config_files'].to_hash.each do |file, hsh|
    str = hsh.to_yaml
    cfg_file = ::File.join(config_dir(app), file)
    file cfg_file do
      content str
      owner app
      group app
    end
  end
end
