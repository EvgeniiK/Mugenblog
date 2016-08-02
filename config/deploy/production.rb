set :port, 22
set :user, 'mugen'
set :deploy_via, :remote_cache
set :use_sudo, false
set :rvm_ruby_version, '2.3.1'
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
