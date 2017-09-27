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

ActiveRecord::Schema.define(version: 20170916102033) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genrescores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "genre_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genrescores_on_genre_id"
    t.index ["user_id"], name: "index_genrescores_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.text "optionA"
    t.text "optionB"
    t.text "optionC"
    t.text "optionD"
    t.string "answer"
    t.integer "qtype"
    t.integer "points"
    t.integer "quizz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quizz_id"], name: "index_questions_on_quizz_id"
  end

  create_table "quesusers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "quizid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_quesusers_on_question_id"
    t.index ["user_id"], name: "index_quesusers_on_user_id"
  end

  create_table "quizzs", force: :cascade do |t|
    t.string "name"
    t.integer "numquestions"
    t.integer "subgenre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subgenre_id"], name: "index_quizzs_on_subgenre_id"
  end

  create_table "states", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quizz_id"
    t.boolean "complete"
    t.integer "score"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quizz_id"], name: "index_states_on_quizz_id"
    t.index ["user_id"], name: "index_states_on_user_id"
  end

  create_table "subgenres", force: :cascade do |t|
    t.string "name"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_subgenres_on_genre_id"
  end

  create_table "subgenrescores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subgenre_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subgenre_id"], name: "index_subgenrescores_on_subgenre_id"
    t.index ["user_id"], name: "index_subgenrescores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "isadmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
