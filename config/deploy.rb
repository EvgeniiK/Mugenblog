# config valid only for current version of Capistrano
lock '3.5.0'
set :repo_url, 'git@github.com:EvgeniiK/Mugenblog.git'

set :use_sudo, false
set :bundle_binstubs, nil
set :scm_username, 'mugen'
set :linked_files, fetch(:linked_files, []).push('config/database.yml',
                                                 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache',
                                               'tmp/sockets', 'vendor/bundle',
                                               'public/system', 'public/assets')

after 'deploy:publishing', 'deploy:restart'
  # after :finishing, 'unicorn:start'

namespace :deploy do
  # after :finishing, 'unicorn:stop'
  # after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:assets:precompile'
  task :restart do
    invoke 'unicorn:reload'
  end
end


# lock '3.5.0'

# set :stages, %w(production staging)
# set :default_stage, "staging"

# set :repo_url, 'git@github.com:AzaLess/outsource_people2015.git'
# set :scm, :git
# set :scm_username, 'AzaLess'

# # files we want symlinking to specific entries in shared.
# set :linked_files, %w(
#   config/database.yml config/secrets.yml config/config.yml config/initializers/appconf.rb
# )
# # bin/wkhtmltopdf

# set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

# # dirs we want symlinking to shared
# set :linked_dirs, %w(bin log public/assets public/system tmp)

# set :tests, []

# # ConditionalDeploy.configure(self) do |conditional|
# #   conditional.register :no_whenever, none_match: 'config/schedule.rb' do |c|
# #     c.skip_task 'whenever:update_crontab'
# #   end

# #   asset_paths = %w(
# #     app/assets Gemfile.lock config/environments config/initializers
# #   )
# #   conditional.register :skip_asset_precompilation, none_match: asset_paths do |c|
# #     c.skip_task 'deploy:compile_assets'
# #     c.skip_task 'deploy:cleanup_assets'
# #     c.skip_task 'deploy:normalize_assets'
# #   end
# # end

# namespace :deploy do
#   after :finishing, 'unicorn:stop'
#   after :finishing, 'deploy:cleanup'
#   after :finishing, 'deploy:assets:precompile'

#   # very bad code :)
#   task :update_cron do
#     on roles(:app) do |host|
#       execute ("cd #{release_path} && /tmp/#{fetch(:application)}/rvm-auto.sh #{fetch(:rvm1_ruby_version)} bundle exec whenever --update-crontab #{fetch(:application)}_#{fetch(:stage)} --set environment=#{fetch(:rails_env)}")
#     end
#   end

#   after :finishing, 'update_cron'


# end
