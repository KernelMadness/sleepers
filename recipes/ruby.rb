include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby node['sleepers']['ruby-version'] do
  global true
end

rbenv_gem 'bundler'

ohai "reload" do
  action :reload
end
