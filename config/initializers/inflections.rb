# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'localidad', 'localidades'
  inflect.irregular 'Localidad', 'Localidades'
  inflect.irregular 'comuna_municipio', 'comunas_municipios'
  inflect.irregular 'ComunaMunicipio', 'ComunasMunicipios'
  inflect.irregular 'productor', 'productores'
  inflect.irregular 'Productor', 'Productores'
  inflect.irregular 'analisis_rsd', 'analisis_rsds'
  inflect.irregular 'AnalisisRsd', 'AnalisisRsds'
  inflect.irregular 'CaniaVariedad', 'CaniaVariedades'
  inflect.irregular 'cania_variedad', 'cania_variedades'
  inflect.irregular 'ProicsaCoordinador', 'ProicsaCoordinadores'
  inflect.irregular 'proicsa_coordinador', 'proicsa_coordinadores'
  inflect.irregular 'ProicsaJefeCoordinador', 'ProicsaJefeCoordinadores'
  inflect.irregular 'proicsa_jefe_coordinador', 'proicsa_jefe_coordinadores'
end
