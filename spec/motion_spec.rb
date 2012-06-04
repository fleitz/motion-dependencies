require 'motion-dependencies'
describe "Motion Dependencies" do

  it "should find one dependency per line" do
   dependency = Motion::Dependencies.dependency_for_line("# depends foo.rb")
   dependency.should eq( "foo.rb" )
  end

  it "should find mutliple dependencies in a file" do
     dependencies = Motion::Dependencies.dependencies_for_file( File.expand_path File.join "spec" ,"testfile.txt")
     dependencies.length.should eq( 2 )
  end

  it "should resolve dependencies from partial matches" do
     bar = "foo/bar.rb"
     resolved = Motion::Dependencies.resolve_dependencies [ bar, "foo/baz.rb"], ["bar.rb"]
     resolved[0].should eq(bar)
  end

end
