Gem::Specification.new do |s|
  s.name        = 'thinappserver'
  s.version     = '0.0.4'
  s.date        = '2013-06-03'
  s.summary     = "Thin Application Server"
  s.description = "...."
  s.authors     = ["Bram Vandenbogaerde"]
  s.email       = 'bram@comicsblog.be'
  s.files       = ["lib/thinappserver.rb"]
  s.bindir = 'bin'
  s.executables   = ["thinapp"]

  s.homepage    = 'http://bramvdb.com/gems/thinappserver/'
  s.requirements << 'Sinatra gem must be installed and thin command must be available(with rack adapater)'
  s.add_dependency("json","~> 1.5.0")
  s.add_dependency("optitron","~> 0.3.0")
end