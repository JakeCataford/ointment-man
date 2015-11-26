# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'ointment-man'
set :repo_url, 'git@github.com:JakeCataford/ointment-man'

namespace :deploy do
  after 'deploy:publishing', 'thin:restart'
end
