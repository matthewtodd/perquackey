# In all its glory:
set :application, 'perquackey'

# Gotta love this new way of writing it.
server 'woodward.joyent.us', :web, :app, :user => 'matthew'

# Git rawks, yo!
set :scm, :git
set :repository, '/users/home/matthew/domains/git.matthewtodd.org/var/lib/repos/perquackey.git'
set :git_shallow_clone, 1

# I'm liking the /var these days
set :deploy_to, '/users/home/matthew/domains/perquackey.matthewtodd.org/var/www'

# RubyInline wisely refuses to run in directories that are group_writable.
set :group_writable, false

# Just me, no fancy app user or anything line that.
set :use_sudo, false
