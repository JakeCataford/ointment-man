# config valid only for current version of Capistrano
lock '3.4.0'
set :application, 'ointment-man'
set :repo_url, 'git@github.com:JakeCataford/ointment-man'
set :rvm_ruby_string, :local        # use the same ruby as used locally for deployment
