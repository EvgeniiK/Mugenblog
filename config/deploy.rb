# config valid only for current version of Capistrano
lock '3.5.0'
set :repo_url, 'git@github.com:EvgeniiK/Mugenblog.git'
set :application, 'mugenblog'

set :stages, %w(production staging)
set :rvm_ruby_version, '2.3.1@mugenblog_4.2.6'


set :linked_files, fetch(:linked_files, []).push('config/database.yml',
                                                 'config/application.yml',
                                                 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache',
                                               'tmp/sockets', 'vendor/bundle',
                                               'public/system', 'public/assets')

after 'deploy:publishing', 'deploy:restart'
  # after :finishing, 'unicorn:start'

namespace :deploy do
  before :finishing, 'unicorn:stop'
  after :finishing, 'unicorn:start'
  # after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:assets:precompile'
  # task :restart do
  #   invoke 'unicorn:reload'
  # end
end
