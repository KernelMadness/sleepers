include_recipe 'ruby_build'

ruby_build_ruby node['sleepers']['ruby-version']

template '/etc/profile.d/ruby.sh' do
  source 'ruby.sh'
end

gem_package 'bundler' do
  gem_binary ::File.join(node['ruby_build']['default_ruby_base_path'], node['sleepers']['ruby-version'], 'bin', 'gem')
end
