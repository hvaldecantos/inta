# == Schema Information
#
# Table name: localidades
#
#  nombre              :string(255)
#  provincia_id        :integer
#  pobla_2001          :float
#  id                  :integer          not null, primary key
#  the_geom            :spatial({:srid=>
#  departamento_id     :integer
#  id_base             :integer
#  comuna_municipio_id :integer
#

require 'spec_helper'

describe Localidad do
  pending "add some examples to (or delete) #{__FILE__}"
end
