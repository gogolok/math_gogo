require 'rake'
require 'rake/testtask'

require 'rake/extensiontask'

Rake::ExtensionTask.new('math_gogo')

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :default => [:compile, :test]
