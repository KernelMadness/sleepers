include_recipe "bluepill"
include_recipe "sudo"

::Chef::Recipe.send(:include, Sleepers::Helpers)

sudo 'bluepill' do
  group 'sleepers'
  commands node['sleepers']['apps'].keys.map {|app| "/usr/sbin/service bluepill-#{app} *" }
  nopasswd true
end

node['sleepers']['apps'].each_with_index do |(app, params), index|
  options = {
    :app_name => app,
    :port => app_port(index),
    :processes => params['processes'],
    :work_dir => work_dir(app)
  }

  template ::File.join(node['bluepill']['conf_dir'], app + '.pill') do
    source 'application.pill.erb'
    helpers(Sleepers::Helpers)
    variables(options)
    notifies :reload, "bluepill_service[#{app}]"
  end

  bluepill_service app do
    action [:enable, :load]
  end
end
