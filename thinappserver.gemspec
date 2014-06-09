Gem::Specification.new do |s|
  s.name        = 'thinappserver'
  s.version     = '0.0.5'
  s.date        = '2014-07-09'
  s.summary     = "Thin Application Server"
  s.description = "...."
  s.authors     = ["Bram Vandenbogaerde"]
  s.email       = 'contact@bramvdb.com'
  s.files       = ["lib/thinappserver.rb"]
  s.bindir = 'bin'
  s.executables   = ["thinapp"]

  s.homepage    = 'http://bramvdb.com/gems/thinappserver/'
  s.requirements << 'Only Rack and thin is needed'
  s.add_dependency("json","~> 1.5.0")
  s.add_dependency("optitron","~> 0.3.0")
end
