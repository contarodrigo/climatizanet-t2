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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140324225911) do

  create_table "agendas", force: true do |t|
    t.date     "data"
    t.time     "hora"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
  end

  add_index "agendas", ["cliente_id"], name: "index_agendas_on_cliente_id"

  create_table "clientes", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "cep"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "municipio"
    t.string   "estado"
    t.string   "telefone"
    t.string   "celular"
    t.string   "cpf"
    t.string   "rg"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
  end

  add_index "clientes", ["usuario_id"], name: "index_clientes_on_usuario_id"

  create_table "equipamentos", force: true do |t|
    t.string   "descricao"
    t.string   "marca"
    t.string   "fornecedor"
    t.string   "potencia"
    t.string   "tipo"
    t.string   "modelo"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
  end

  add_index "equipamentos", ["usuario_id"], name: "index_equipamentos_on_usuario_id"

  create_table "items", force: true do |t|
    t.float    "qtdequipamento"
    t.float    "qtdtubulacao"
    t.float    "qtdextra"
    t.string   "tubulacao"
    t.string   "extra"
    t.decimal  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "orcamento_id"
    t.string   "descricao"
  end

  add_index "items", ["orcamento_id"], name: "index_items_on_orcamento_id"

  create_table "orcamentos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.string   "descricao"
    t.date     "validade"
  end

  add_index "orcamentos", ["cliente_id"], name: "index_orcamentos_on_cliente_id"

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
