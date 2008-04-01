set :application, 'perquackey'
set :repository,  '/users/home/matthew/domains/git.matthewtodd.org/var/lib/repos/perquackey.git'

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, '/users/home/matthew/domains/perquackey.matthewtodd.org/var/www'

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :scm_command, '/usr/local/bin/git'
set :git_shallow_clone, 1

role :app, 'woodward.joyent.us', :user => 'matthew'
role :web, 'woodward.joyent.us', :user => 'matthew'
role :db,  'woodward.joyent.us', :user => 'matthew', :primary => true

set :runner, 'matthew'
set :run_method, :run
set :group_writable, false
