require 'json'

class ThinAppServer
  def initialize(config)
    contents = File.read(config);
    @config = JSON.parse(contents)
    @verbose = "true"
    @servers = @config["servers"]
  end

  def startServers(name)
    if(name != "all")
      startOne(name)
      return;
    end
    @servers.each do |server|
      server = server["name"]
      type = server["type"]

      if(type == "external")
        return;
        
      end
      settings = File.read(server+"/config.json")
      props = JSON.parse(settings)
      log "Starting server: "+server+" ..."
      if(!File.exists? server+"/"+server+".running")
        system("cd "+server+" && thin start -p"+props["port"]+" -d -P "+server+".running")
      end
    end
  end

  def kill(name)
    if(name != "all")
      killone(name)
      return
    end
    @servers.each do |server|
      server = server["name"]
      type = server["type"]

      if(type == "external")
        return;
      end

      if(File.exists? server+"/"+server+".running")
        system("cd "+server+" && kill `cat "+server+".running`");
      end
    end
  end

  def killone(name)
    puts "Stopping "+name
    system("cd "+name+" && kill `cat "+name+".running`");
  end

  def startOne(name)
    settings = File.read(name+"/config.json")
    props = JSON.parse(settings)
    system("cd "+name+" && thin start -p "+props["port"]+" -d -P "+name+".running");
  end

  def log(msg)
    if(@verbose)
      puts msg
    end
  end 

  def status
    puts "##### NOTE #### Server status is not working for external applications right now ##### NOTE #######"
    @servers.each do |server|
      server = server["name"]
      type = server["type"]

      if(type == "external")
        return;
      end
      if(File.exists? server+"/"+server+".running")
        settings = File.read(server+"/config.json")
        props = JSON.parse(settings)
        log "Application: "+server+", is RUNNING on port "+props["port"]
      else
        log "Application: "+server+", is NOT RUNNING"
      end
    end
  end
end

