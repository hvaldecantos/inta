class AddColumnToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :persona_id, :integer
    add_index :profiles, :persona_id
  end
end
