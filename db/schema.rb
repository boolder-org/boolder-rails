# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_04_211106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "boulders", force: :cascade do |t|
    t.geography "polygon", limit: {:srid=>4326, :type=>"st_polygon", :geographic=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "area_id"
    t.index ["area_id"], name: "index_boulders_on_area_id"
  end

  create_table "circuits", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "area_id"
    t.integer "order"
    t.index ["area_id"], name: "index_circuits_on_area_id"
  end

  create_table "pois", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "description"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.geography "route", limit: {:srid=>4326, :type=>"line_string", :geographic=>true}
    t.bigint "area_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_pois_on_area_id"
    t.index ["location"], name: "index_pois_on_location", using: :gist
  end

  create_table "problems", force: :cascade do |t|
    t.string "name"
    t.string "grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.bigint "circuit_id"
    t.string "circuit_number"
    t.string "steepness", null: false
    t.integer "height"
    t.bigint "area_id"
    t.string "tags", default: [], null: false, array: true
    t.index ["area_id"], name: "index_problems_on_area_id"
    t.index ["circuit_id"], name: "index_problems_on_circuit_id"
    t.index ["location"], name: "index_problems_on_location", using: :gist
    t.index ["tags"], name: "index_problems_on_tags", using: :gin
  end

  create_table "topos", force: :cascade do |t|
    t.json "line"
    t.bigint "problem_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["problem_id"], name: "index_topos_on_problem_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "boulders", "areas"
  add_foreign_key "circuits", "areas"
  add_foreign_key "problems", "areas"
end
