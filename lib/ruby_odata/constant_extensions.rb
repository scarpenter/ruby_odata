class Object
  def camelcase
    self.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
  end
  
  def constantize
    names = self.split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  end
  
  def to_json(args)
    hash = {}
    self.instance_variables.each do |var|
      hash[var.to_s.sub("@", "")] = self.instance_variable_get var
    end
    hash.to_json
  end
end
