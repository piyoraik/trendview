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

ActiveRecord::Schema.define(version: 0) do

  create_table "twitter_trend", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "rank", null: false
    t.string "word", limit: 25, null: false
    t.integer "tweetcount"
    t.text "url", null: false
    t.string "city", limit: 5, null: false
    t.timestamp "now", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "weather", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "nowtime"
    t.string "city", limit: 5, null: false, collation: "utf8mb4_bin"
    t.date "timedate", null: false
    t.text "image", null: false, collation: "utf8mb4_bin"
    t.string "weather", limit: 5, null: false, collation: "utf8mb4_bin"
    t.integer "minw"
    t.integer "maxw"
    t.text "text", null: false, collation: "utf8mb4_bin"
  end

end
