
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