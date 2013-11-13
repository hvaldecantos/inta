class AddColumnDataOriginIdToAnalisisRsds < ActiveRecord::Migration
  def change
    add_column :analisis_rsds, :_data_origin_id, :integer # a hidden column to track the origin of the data
  end
end
