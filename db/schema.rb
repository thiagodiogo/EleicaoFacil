# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100521030614) do

  create_table "chapas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locals", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "secao"
    t.integer  "mesa"
  end

  create_table "registro_de_votos", :force => true do |t|
    t.integer  "chapa_id"
    t.integer  "local_id"
    t.integer  "votos_docentes"
    t.integer  "votos_tecnicoadm"
    t.integer  "votos_alunos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votos_docentes_brancos"
    t.integer  "votos_docentes_nulos"
    t.integer  "votos_docentes_abstinencia"
    t.integer  "votos_tecnicoadm_brancos"
    t.integer  "votos_tecnicoadm_nulos"
    t.integer  "votos_tecnicoadm_abstinencia"
    t.integer  "votos_alunos_brancos"
    t.integer  "votos_alunos_nulos"
    t.integer  "votos_alunos_abstinencia"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "usuarios", ["login"], :name => "index_usuarios_on_login", :unique => true

end
