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

ActiveRecord::Schema.define(:version => 20130827143312) do

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
  end

  create_table "departamentos", :id => false, :force => true do |t|
    t.integer "provincia_id"
    t.integer "id_base"
    t.string  "id",           :null => false
    t.string  "nombre"
    t.string  "cabecera"
  end

  create_table "localidades", :id => false, :force => true do |t|
    t.string  "nombre"
    t.integer "provincia_id"
    t.float   "pobla_2001"
    t.integer "id",                   :null => false
    t.integer "departamento_id"
    t.string  "id_base"
    t.integer "comunas_municipio_id"
  end

  create_table "parajes", :id => false, :force => true do |t|
    t.integer "id",                   :null => false
    t.string  "nombre"
    t.integer "localidad_id"
    t.string  "tipo"
    t.integer "departamento_id"
    t.integer "comunas_municipio_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono_fijo"
    t.string   "telefono_celular"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
