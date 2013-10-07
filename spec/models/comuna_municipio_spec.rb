# == Schema Information
#
# Table name: comunas_municipios
#
#  nombre               :string(255)
#  categoria            :string(255)
#  provincia_id         :integer
#  departamento_id_base :integer
#  id_base              :integer
#  fuente               :string(255)
#  agencia_id           :integer
#  departamento_id      :integer
#  id                   :integer          not null, primary key
#

require 'spec_helper'

describe ComunaMunicipio do
  pending "add some examples to (or delete) #{__FILE__}"
end
