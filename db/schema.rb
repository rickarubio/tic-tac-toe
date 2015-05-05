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

ActiveRecord::Schema.define(version: 20150505074804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["game_id"], name: "index_boards_on_game_id", using: :btree

  create_table "cells", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
    t.integer  "board_position"
    t.integer  "turn_id"
  end

  add_index "cells", ["board_id"], name: "index_cells_on_board_id", using: :btree
  add_index "cells", ["turn_id"], name: "index_cells_on_turn_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "finished",   default: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "winner"
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id", using: :btree

  create_table "turns", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "turns", ["game_id"], name: "index_turns_on_game_id", using: :btree
  add_index "turns", ["player_id"], name: "index_turns_on_player_id", using: :btree

end
