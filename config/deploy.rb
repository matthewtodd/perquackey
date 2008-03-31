set :application, 'perquackey'
set :repository,  'http://git.matthewtodd.org/perquackey.git'

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, '/users/home/matthew/domains/perquackey.matthewtodd.org/var/www'

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :scm_command, '/usr/local/bin/git'

role :app, 'woodward.joyent.us', :user => 'matthew'
role :web, 'woodward.joyent.us', :user => 'matthew'
role :db,  'woodward.joyent.us', :user => 'matthew', :primary => true

set :runner, 'matthew'
set :run_method, :run
set :group_writable, false

# Joyent recommend starting and monitoring Rails processes as "Bootup Actions".
# From my experimentation, it seems like trying to spawn Mongrel via Capistrano
# in the usual way interferes with (and is interfered with by) these Bootup
# Actions. So, I'm disabling start and overriding restart to just do a "stop".
# The Solaris Bootup Action will notice when Mongrel dies and restart it 
# immediately.
namespace :deploy do
  desc 'Start the application servers.'
  task :start do
    puts 'To start the application, please use the Bootup Actions at'
    puts 'https://virtualmin.joyent.us/woodward/virtualmin-init/index.cgi?dom=120695737911739'
  end
  
  desc 'Restarts your application.'
  task :restart do
    stop
  end
  
  desc 'Stop the application servers.'
  task :stop, :roles => :app do
    as = fetch(:runner, "app")
    via = fetch(:run_method, :sudo)
    invoke_command "#{current_path}/script/process/reaper -a kill", :via => via, :as => as
  end
end