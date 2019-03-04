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

ActiveRecord::Schema.define(version: 2019_03_04_190736) do

  create_table "exam_questions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.text "explanation"
    t.integer "exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
  end

  create_table "preparation_questions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.text "hint"
    t.integer "use_count", default: 0
  end

  create_table "preparation_questions_tests", id: false, force: :cascade do |t|
    t.integer "preparation_test_id", null: false
    t.integer "preparation_question_id", null: false
  end

  create_table "preparation_tests", force: :cascade do |t|
    t.string "name"
  end

end
