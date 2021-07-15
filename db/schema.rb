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

ActiveRecord::Schema.define(version: 2021_07_05_144334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devlopers", force: :cascade do |t|
    t.string "devloper_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "editors", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "game_name"
    t.text "description"
    t.date "release"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "editor_id"
    t.bigint "devloper_id"
    t.index ["devloper_id"], name: "index_games_on_devloper_id"
    t.index ["editor_id"], name: "index_games_on_editor_id"
  end

  create_table "games_genres", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "genre_id", null: false
    t.index ["game_id", "genre_id"], name: "index_games_genres_on_game_id_and_genre_id"
    t.index ["genre_id", "game_id"], name: "index_games_genres_on_genre_id_and_game_id"
  end

  create_table "games_platforms", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "platform_id", null: false
    t.index ["game_id", "platform_id"], name: "index_games_platforms_on_game_id_and_platform_id"
    t.index ["platform_id", "game_id"], name: "index_games_platforms_on_platform_id_and_game_id"
  end

  create_table "games_themes", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "theme_id", null: false
    t.index ["game_id", "theme_id"], name: "index_games_themes_on_game_id_and_theme_id"
    t.index ["theme_id", "game_id"], name: "index_games_themes_on_theme_id_and_game_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "platform_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "theme_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
