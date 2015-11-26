APP_DIR = "/var/www/ointment-man/current/"

worker_processes 2
working_directory APP_DIR
preload_app true
timeout 30
listen "#{APP_DIR}tmp/sockets/unicorn.sock", :backlog => 64
pid "#{APP_DIR}tmp/pids/unicorn.pid"
stderr_path "#{APP_DIR}log/unicorn.stderr.log"
stdout_path "#{APP_DIR}log/unicorn.stdout.log"
