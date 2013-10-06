class AddTypeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :type, :string
    add_column :profiles, :proicsa_agente_id, :integer

    add_index :profiles, :proicsa_agente_id
  end
end
