module Dependencies

  DEPENDENCY_LINE = "# depends "
  DEPENDENCY_LINE_LENGTH = DEPENDENCY_LINE.length
  def dependency_for_line(line)
    if line.start_with? DEPENDENCY_LINE
      return line.slice(DEPENDENCY_LINE_LENGTH, line.length - DEPENDENCY_LINE_LENGTH).strip
    end
    nil
  end

  def dependencies_for_file(file)
    File.open(file).map({ |line| depenency_for_line(line) }).select({ |x| x })
  end

  def resolve_depenendencies files, dependencies
    files.select do |file|
      dependencies.select({ |dependency| file.include? dependency }).length > 0
    end
  end

  def find_dependencies(files)
    dependencies = {}
    files.each do |file|
      unresolved_dependencies = dependencies_for_file(file)
      if(dependencies.length > 0)
        dependencies[file] = resolve_depenendencies files, dependencies
      end
    end
    dependencies
  end

end
