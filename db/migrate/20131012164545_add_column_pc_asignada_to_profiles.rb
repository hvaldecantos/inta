class AddColumnPcAsignadaToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :pc_asignada, :string
  end
end
