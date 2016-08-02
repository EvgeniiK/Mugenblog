set :port, 22
set :user, 'mugen'
set :deploy_via, :remote_cache
set :use_sudo, false
set :rvm1_ruby_version, 'ruby-2.3.1@mugenblog_4.2.6'


set :branch, 'master'
set :application, 'mugenblog'
set :assets_roles, [:web, :app]

server '46.101.211.90',
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'mugen',
}

set :rails_env, :production
set :conditionally_migrate, true


#  set :application, 'outsource_people2015'
# set :deploy_to, '/home/outsource_people/outsource_people_app'

# # RVM-specific config
# set :rails_env, :production
# set :branch, 'master'

# set :rvm1_ruby_version, 'ruby-2.1.2@outsource'

# server 'vm1.sloboda-studio.com',
#        user: 'outsource_people',
#        roles: %w(web app db),
#        ssh_options: {
#          port: 2222
#        }
