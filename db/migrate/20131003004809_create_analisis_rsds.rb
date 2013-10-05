class CreateAnalisisRsds < ActiveRecord::Migration
  def change
    create_table :analisis_rsds do |t|
      t.date :fecha_extraccion
      t.date :fecha_ingreso
      t.date :fecha_analisis
      t.integer :variedad_id
      t.string :membrana
      t.date :anio_plantacion
      t.integer :parcela_id
      t.integer :paraje_id
      t.integer :departamento_id
      t.integer :comuna_municipio_id
      t.integer :localidad_id
      t.integer :productor_id
      t.integer :procedencia_id
      t.integer :agente_id
      t.integer :promotor_id
      t.integer :laboratorista_id
      t.float :incidencia
      t.boolean :analizado

      t.timestamps
    end
  end
end
