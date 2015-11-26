# config valid only for current version of Capistrano
lock '3.4.0'
set :application, 'ointment-man'
set :repo_url, 'git@github.com:JakeCataford/ointment-man'

require "rvm/capistrano"

set :rvm_ruby_string, :local        # use the same ruby as used locally for deployment

before 'deploy', 'rvm:install_rvm'  # install/update RVM
before 'deploy', 'rvm:install_ruby' # install Ruby and create gemset (both if missing)
