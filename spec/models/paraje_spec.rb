# == Schema Information
#
# Table name: parajes
#
#  id                  :integer          not null, primary key
#  nombre              :string(255)
#  localidad_id        :integer
#  tipo                :string(255)
#  departamento_id     :integer
#  the_geom            :spatial({:srid=>
#  comuna_municipio_id :integer
#

require 'spec_helper'

describe Paraje do
  pending "add some examples to (or delete) #{__FILE__}"
end
