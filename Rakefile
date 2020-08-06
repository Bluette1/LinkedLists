require 'rspec/core/rake_task'

task :default => :spec

desc "run tests for this repo"
RSpec::Core::RakeTask.new do |task|
  lab = Rake.application.original_dir
  task.pattern = "#{lab}/spec/*_spec.rb"
  task.rspec_opts = [ "-I#{lab}", "-I#{lab}/solution", '-f documentation', '-r ./rspec_config']
  task.verbose = false
end