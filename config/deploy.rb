require 'capistrano/ext/textdrive'

set :application, 'perquackey'
set :domain,      'matthewtodd.org'
set :repository,  'http://matthewtodd.org/svn/public/perquackey'

task :after_setup do
  create_application_directories
  create_application_startup_script
  configure_reboot
  configure_apache
  configure_lighttpd
  restart_lighttpd
end

task :after_update_code do
  symlink_tmp_sockets
end