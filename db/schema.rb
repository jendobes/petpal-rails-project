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

ActiveRecord::Schema.define(version: 2018_04_24_220720) do

  create_table "adoptions", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "pet_id"
    t.text "story"
  end

  create_table "fosters", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "pet_id"
    t.text "story"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.boolean "adopter"
    t.boolean "fosterer"
    t.integer "zip_code"
    t.string "password_digest"
    t.string "email"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "species"
    t.string "breed"
    t.integer "age"
    t.text "bio"
    t.integer "zip_code"
    t.boolean "kill_shelter"
    t.boolean "fosterer"
    t.boolean "adopter"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

end
