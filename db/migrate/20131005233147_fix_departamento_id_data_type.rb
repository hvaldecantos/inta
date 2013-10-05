class FixDepartamentoIdDataType < ActiveRecord::Migration
  def up
    execute "ALTER TABLE departamentos ALTER COLUMN id TYPE integer USING CAST(id AS INTEGER)"
  end

  def down
  end
end
