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

ActiveRecord::Schema[7.0].define(version: 2023_12_11_183004) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published", default: false, null: false
    t.string "slug"
    t.string "tags", default: [], null: false, array: true
    t.string "short_name"
    t.integer "priority", limit: 2, default: 3, null: false
    t.text "description_fr"
    t.text "description_en"
    t.text "warning_fr"
    t.text "warning_en"
    t.integer "bleau_area_id", null: false
    t.index ["slug"], name: "index_areas_on_slug", unique: true
    t.index ["tags"], name: "index_areas_on_tags", using: :gin
  end

  create_table "bleau_areas", force: :cascade do |t|
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_bleau_areas_on_slug", unique: true
  end

  create_table "bleau_problems", force: :cascade do |t|
    t.string "name"
    t.string "grade"
    t.string "steepness"
    t.boolean "sit_start"
    t.string "tags", default: [], null: false, array: true
    t.bigint "bleau_circuit_id"
    t.string "circuit_number"
    t.string "circuit_letter"
    t.integer "ascents"
    t.integer "ratings"
    t.decimal "ratings_average"
    t.bigint "bleau_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bleau_area_id"], name: "index_bleau_problems_on_bleau_area_id"
    t.index ["bleau_circuit_id"], name: "index_bleau_problems_on_bleau_circuit_id"
  end

  create_table "boulders", force: :cascade do |t|
    t.geography "polygon", limit: {:srid=>4326, :type=>"st_polygon", :geographic=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.boolean "ignore_for_area_hull", default: false, null: false
    t.index ["area_id"], name: "index_boulders_on_area_id"
  end

  create_table "circuits", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "risk", limit: 2
  end

  create_table "contribution_requests", force: :cascade do |t|
    t.string "what", null: false
    t.string "state", null: false
    t.geography "location_estimated", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.bigint "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_contribution_requests_on_problem_id"
    t.index ["state"], name: "index_contribution_requests_on_state"
    t.index ["what"], name: "index_contribution_requests_on_what"
  end

  create_table "contributions", force: :cascade do |t|
    t.bigint "problem_id"
    t.text "comment"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contributor_name"
    t.string "contributor_email"
    t.string "state", default: "pending", null: false
    t.string "problem_name"
    t.string "problem_url"
    t.index ["problem_id"], name: "index_contributions_on_problem_id"
  end

  create_table "lines", force: :cascade do |t|
    t.json "coordinates"
    t.bigint "problem_id"
    t.bigint "topo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_lines_on_problem_id"
    t.index ["topo_id"], name: "index_lines_on_topo_id"
  end

  create_table "poi_routes", force: :cascade do |t|
    t.integer "distance", null: false
    t.string "transport", null: false
    t.bigint "area_id"
    t.bigint "poi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_poi_routes_on_area_id"
    t.index ["poi_id"], name: "index_poi_routes_on_poi_id"
  end

  create_table "pois", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "google_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poi_type", default: "parking", null: false
  end

  create_table "problems", force: :cascade do |t|
    t.string "name"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.bigint "circuit_id"
    t.string "circuit_number"
    t.string "steepness", null: false
    t.integer "height"
    t.bigint "area_id"
    t.string "tags", default: [], null: false, array: true
    t.integer "bleau_info_id"
    t.string "landing"
    t.boolean "risky", default: false, null: false
    t.boolean "featured", default: false, null: false
    t.bigint "parent_id"
    t.decimal "ratings_average"
    t.integer "ratings"
    t.integer "ascents"
    t.integer "popularity"
    t.string "circuit_letter"
    t.index ["area_id"], name: "index_problems_on_area_id"
    t.index ["circuit_id"], name: "index_problems_on_circuit_id"
    t.index ["grade"], name: "index_problems_on_grade"
    t.index ["location"], name: "index_problems_on_location", using: :gist
    t.index ["tags"], name: "index_problems_on_tags", using: :gin
  end

  create_table "topos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published", default: true, null: false
    t.json "metadata"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "boulders", "areas"
  add_foreign_key "problems", "areas"
end
