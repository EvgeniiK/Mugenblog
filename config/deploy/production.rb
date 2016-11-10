set :port, 80
set :user, 'ubuntu'
set :deploy_via, :remote_cache
set :use_sudo, false
set :rvm1_ruby_version, 'ruby-2.3.1@mugenblog_4.2.6'


set :branch, 'master'
set :application, 'mugenblog'
set :assets_roles, [:web, :app]

server '52.57.30.167',
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'ubuntu',
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
