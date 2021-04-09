class Turtle
  def initialize(&block)
    instance_exec(&block)
  end

  def attributes
    @_attributes ||= {}
  end

  def method_missing(name, *args, &block)
    name = name.to_s

    if block_given?
      attributes[name] = Turtle.new(&block)
    elsif args.length == 1 #Setter
      name = name[0...-1] if name.end_with?('=')
      attributes[name] = args.first
    elsif args.empty? # Getter
      val = attributes[name]

      attributes[name] = val.call() if val.is_a?(Proc)
      attributes[name]
    end
  end
end
