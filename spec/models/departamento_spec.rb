# == Schema Information
#
# Table name: departamentos
#
#  provincia_id :integer
#  id_base      :integer
#  id           :integer          not null, primary key
#  nombre       :string(255)
#  cabecera     :string(255)
#  the_geom     :spatial({:srid=>
#

require 'spec_helper'

describe Departamento do
  pending "add some examples to (or delete) #{__FILE__}"
end
