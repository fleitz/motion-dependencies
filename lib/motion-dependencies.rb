module Motion
  module Dependencies
    DEPENDENCY_LINE = "# depends "
    DEPENDENCY_LINE_LENGTH = DEPENDENCY_LINE.length

    def self.dependency_for_line(line)
      if line.start_with? DEPENDENCY_LINE
        return line.slice(DEPENDENCY_LINE_LENGTH, line.length - DEPENDENCY_LINE_LENGTH).strip
      end
      nil
    end

    def self.dependencies_for_file(file)
      File.open(file).each.map(&lambda {|line| dependency_for_line(line)})
      .select(&lambda {|x| x })
    end

    def self.resolve_dependencies files, dependencies
      files = files.select do |file|
        dependencies.select do |dependency|
          file.include? dependency
        end.length > 0
      end
      files.uniq
    end

    def self.find_dependencies(files)
      dependencies = {}
      files.each do |file|
        unresolved_dependencies = dependencies_for_file(file)
        if(unresolved_dependencies.length > 0)
          dependencies[file] = resolve_dependencies files, unresolved_dependencies
        end
      end
      dependencies
    end

  end
end
