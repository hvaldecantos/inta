# == Schema Information
#
# Table name: productores
#
#  id                  :integer          not null, primary key
#  nombre              :string(255)
#  apellido            :string(255)
#  dni                 :string(255)
#  departamento_id     :integer
#  comuna_municipio_id :integer
#  agencia             :string(255)
#  email_extensionista :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'spec_helper'

describe Productor do
  pending "add some examples to (or delete) #{__FILE__}"
end
