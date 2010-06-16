require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/xramble'
require 'hanna/rdoctask'

Hoe.plugin :newgem

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'xramble' do
  self.developer 'Liehann Loots', 'liehannl@gmail.com'
  self.rubyforge_name       = self.name # TODO this is default value
  # self.extra_deps         = [['activesupport','>= 2.0.2']]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }


desc 'Generate RDoc documentation for xramble'
Rake::RDocTask.new() do |rdoc|
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.main = "README.rdoc"
  rdoc.title = 'xramble documentation'
  rdoc.rdoc_dir = 'doc'
end

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]
