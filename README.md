# Motion::Dependencies



## Installation

    $ gem install motion-dependencies

Add this line to your application's Rakefile:

    require 'motion-dependencies'
    Motion::Project::App.setup do |app|
      app.files = Dir.glob('./app/lib/**/*.rb') | Dir.glob('./app/**/*.rb') 
      app.files_dependencies = Motion::Dependencies.find_dependencies(app.files)
    end


## Usage
    
    # depends your-mixin.rb
    class FooViewController < UIViewController
      include YourMixin
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
