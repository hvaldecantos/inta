class AddColumnProgramaIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :programa_id, :integer
  end
end
