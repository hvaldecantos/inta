
def modelos
    Dir["#{Rails.root}/app/models/**/*.rb"].map do |f|
      f.chomp('.rb').scan(/[^\/]*$/)[0].camelize
    end
end

class ActiveRecord::Base
  def self.clases_derivadas
    modelos.select{|c| (c.constantize.superclass == self)}
  end
end

class String
  def to_bool
    return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end
