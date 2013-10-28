# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131028150152) do

  create_table "analisis_rsds", :force => true do |t|
    t.date     "fecha_extraccion"
    t.date     "fecha_ingreso"
    t.date     "fecha_analisis"
    t.integer  "variedad_id"
    t.string   "membrana"
    t.date     "anio_plantacion"
    t.integer  "parcela_id"
    t.integer  "paraje_id"
    t.integer  "departamento_id"
    t.integer  "comuna_municipio_id"
    t.integer  "localidad_id"
    t.integer  "productor_id"
    t.integer  "procedencia_id"
    t.integer  "agente_id"
    t.integer  "promotor_id"
    t.integer  "laboratorista_id"
    t.float    "incidencia"
    t.boolean  "analizado"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "assignments", :id => false, :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "role_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assignments", ["user_id", "role_id"], :name => "index_assignments_on_user_id_and_role_id", :unique => true

  create_table "comunas_municipios", :id => false, :force => true do |t|
    t.string  "nombre"
    t.string  "categoria"
    t.integer "provincia_id"
    t.integer "departamento_id_base"
    t.integer "id_base"
    t.string  "fuente"
    t.integer "agencia_id"
    t.integer "departamento_id"
    t.integer "id",                   :null => false
    t.spatial "the_geom",             :limit => {:srid=>22173, :type=>"multi_polygon"}
  end

  create_table "departamentos", :id => false, :force => true do |t|
    t.integer "provincia_id"
    t.integer "id_base"
    t.integer "id",           :null => false
    t.string  "nombre"
    t.string  "cabecera"
    t.spatial "the_geom",     :limit => {:srid=>22173, :type=>"multi_polygon"}
  end

  create_table "localidades", :id => false, :force => true do |t|
    t.string  "nombre"
    t.integer "provincia_id"
    t.float   "pobla_2001"
    t.integer "id",                  :null => false
    t.spatial "the_geom",            :limit => {:srid=>22173, :type=>"point"}
    t.integer "departamento_id"
    t.integer "id_base"
    t.integer "comuna_municipio_id"
  end

  create_table "parajes", :id => false, :force => true do |t|
    t.integer "id",                  :null => false
    t.string  "nombre"
    t.integer "localidad_id"
    t.string  "tipo"
    t.integer "departamento_id"
    t.spatial "the_geom",            :limit => {:srid=>22173, :type=>"point"}
    t.integer "comuna_municipio_id"
  end

  create_table "personas", :force => true do |t|
    t.integer  "user_id"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "dni"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "telefono_fijo"
    t.string   "telefono_celular"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "type"
    t.integer  "proicsa_agente_id"
    t.integer  "persona_id"
    t.string   "pc_asignada"
  end

  add_index "profiles", ["persona_id"], :name => "index_profiles_on_persona_id"
  add_index "profiles", ["proicsa_agente_id"], :name => "index_profiles_on_proicsa_agente_id"

  create_table "programas", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "programa_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
