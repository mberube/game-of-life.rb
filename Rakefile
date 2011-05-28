require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
namespace :cover_me do
  task :report do
  end
end

task :spec do
	RSpec::Core::RakeTask.new
end
task :report => [:spec] do
	require 'cover_me'
	CoverMe.complete!
end

task :default => :spec
