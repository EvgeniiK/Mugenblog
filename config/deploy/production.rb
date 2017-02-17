set :port, 22
set :user, 'ubuntu'


set :branch, 'master'
set :assets_roles, [:web, :app]

server '52.57.30.167',
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true
}

set :rails_env, :production


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
