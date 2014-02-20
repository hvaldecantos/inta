class CreateAnalisisPrezafras < ActiveRecord::Migration
  def change
    create_table :analisis_prezafras do |t|
      t.string :identificacion
      t.date :fecha_inicio
      t.date :fecha_extraccion
      t.date :fecha_ingreso
      t.date :fecha_analisis
      t.integer :productor_id
      t.integer :parcela_id
      t.integer :agente_id
      t.integer :promotor_id
      t.integer :laboratorista_id
      t.point :latlon, :geographic => true
      t.float :peso_muestra
      t.float :peso_tallo
      t.integer :variedad_id
      t.float :brix_pct
      t.float :lectura_polar
      t.float :pol_pct_jugo
      t.float :pureza_pct
      t.float :pol_pct_cania
      t.float :rto_pct
      t.string :estado
      t.string :observaciones

      t.timestamps
    end
  end
end
