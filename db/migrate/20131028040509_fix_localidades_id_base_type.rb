class FixLocalidadesIdBaseType < ActiveRecord::Migration
  def up
    execute "ALTER TABLE localidades ALTER COLUMN id_base TYPE integer USING CAST(id_base AS INTEGER)"
  end

  def down
  end
end
