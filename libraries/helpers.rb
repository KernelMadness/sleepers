module Sleepers
  module Helpers
    def app_port(index)
      node['sleepers']['internal_port_base'] + index
    end

    def start_command_with_port(cmd, port)
      cmd.gsub '$PORT', port.to_s
    end

    def pids_dir(app)
      app_dir(app, node['sleepers']['pids_dir'])
    end

    def work_dir(app)
      app_dir(app, node['sleepers']['root_dir'])
    end

    def config_dir(app)
      app_dir(app, node['sleepers']['config_dir'])
    end

    def public_dir(app)
      app_dir(app, node['sleepers']['public_dir'])
    end

    def app_dir(app, dir = nil)
      ::File.join(node['sleepers']['home_dir'], app, dir)
    end

    def pid_file(app, process)
      ::File.join(pids_dir(app), process + '.pid')
    end

    def access_log(app)
      ::File.join(node['sleepers']['nginx_log_dir'], app + '.access.log')
    end

    def error_log(app)
      ::File.join(node['sleepers']['nginx_log_dir'], app + '.error.log')
    end
  end
end
