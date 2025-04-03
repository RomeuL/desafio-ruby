# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_03_170446) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "armas", force: :cascade do |t|
    t.string "modelo"
    t.string "registro"
    t.boolean "emprestada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "despachos", force: :cascade do |t|
    t.bigint "guarda_id", null: false
    t.string "matricula_armeiro"
    t.datetime "data"
    t.string "tipo"
    t.bigint "arma_id", null: false
    t.integer "quantidade_balas"
    t.string "calibre"
    t.integer "quantidade_carregadores"
    t.string "porte_guarda"
    t.string "matricula_guarda"
    t.text "justificativa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "armeiro_id"
    t.index ["arma_id"], name: "index_despachos_on_arma_id"
    t.index ["armeiro_id"], name: "index_despachos_on_armeiro_id"
    t.index ["guarda_id"], name: "index_despachos_on_guarda_id"
  end

  create_table "equipes", force: :cascade do |t|
    t.string "nome"
    t.bigint "unidade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_id"], name: "index_equipes_on_unidade_id"
  end

  create_table "guardas", force: :cascade do |t|
    t.string "nome_completo"
    t.string "matricula"
    t.string "porte_arma"
    t.bigint "equipe_id", null: false
    t.boolean "armeiro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipe_id"], name: "index_guardas_on_equipe_id"
    t.index ["matricula"], name: "index_guardas_on_matricula", unique: true
    t.index ["porte_arma"], name: "index_guardas_on_porte_arma", unique: true
  end

  create_table "unidades", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "despachos", "armas"
  add_foreign_key "despachos", "guardas"
  add_foreign_key "despachos", "guardas", column: "armeiro_id"
  add_foreign_key "equipes", "unidades"
  add_foreign_key "guardas", "equipes"
end
