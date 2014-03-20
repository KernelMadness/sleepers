node['sleepers']['apps'].each_with_index do |(app, params), index|
  node.default['sleepers']['apps'][app] = node['sleepers']['app']
end
