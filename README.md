# Get rid of that ruby motion dependency hash.
 
Instead have dependencies built from
your files

## Say goodbye to

    ```ruby
    app.files_dependencies { 'app/foo_controller.rb' => 'app/app_controller.rb', 'app/baz_controller.rb' => 'app/app_controller.rb' }
    ```
## Say hello to

    ```ruby
    # depends app_controller.rb
    class FooController < AppController
    
    end
    ```


## Installation

    $ gem install motion-dependencies

Add this line to your application's Rakefile:

    ```ruby
    require 'motion-dependencies'
    Motion::Project::App.setup do |app|
      app.files = Dir.glob('./app/lib/**/*.rb') | Dir.glob('./app/**/*.rb') 
      app.files_dependencies = Motion::Dependencies.find_dependencies(app.files)
    end
    ```


## Usage
    
```ruby
# depends your-mixin.rb
class FooViewController < UIViewController
  include YourMixin
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
