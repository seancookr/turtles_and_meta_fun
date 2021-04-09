task :console do
  require 'pry'
  require 'zeitwerk'

  loader = Zeitwerk::Loader.new
  loader.push_dir('lib')
  loader.setup
  ARGV.clear
  Pry.start
end
