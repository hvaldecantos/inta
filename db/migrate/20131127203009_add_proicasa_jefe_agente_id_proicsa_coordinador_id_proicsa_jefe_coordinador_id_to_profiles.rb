class AddProicasaJefeAgenteIdProicsaCoordinadorIdProicsaJefeCoordinadorIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :proicsa_jefe_agente_id, :integer
    add_column :profiles, :proicsa_coordinador_id, :integer
    add_column :profiles, :proicsa_jefe_coordinador_id, :integer

    add_index :profiles, :proicsa_jefe_agente_id
    add_index :profiles, :proicsa_coordinador_id
    add_index :profiles, :proicsa_jefe_coordinador_id
  end
end
