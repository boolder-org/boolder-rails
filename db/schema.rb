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

ActiveRecord::Schema[7.1].define(version: 2024_11_28_202917) do
  create_schema "heroku_ext"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "unaccent"

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
    t.text "description_en"
    t.text "warning_en"
    t.integer "cluster_id"
    t.index ["slug"], name: "index_areas_on_slug", unique: true
    t.index ["tags"], name: "index_areas_on_tags", using: :gin
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "boulders", force: :cascade do |t|
    t.geography "polygon", limit: {:srid=>4326, :type=>"st_polygon", :geographic=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.boolean "ignore_for_area_hull", default: false, null: false
    t.index ["area_id"], name: "index_boulders_on_area_id"
  end

  create_table "clusters", force: :cascade do |t|
    t.string "name"
    t.integer "main_area_id"
    t.geography "center", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.geography "sw", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.geography "ne", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contribution_requests", force: :cascade do |t|
    t.string "what", null: false
    t.string "state", null: false
    t.geography "location_estimated", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.bigint "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
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

  create_table "imports", force: :cascade do |t|
    t.datetime "applied_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "sector_id"
    t.string "steepness", null: false
    t.integer "height"
    t.bigint "area_id"
    t.string "landing"
    t.boolean "featured", default: false, null: false
    t.bigint "parent_id"
    t.boolean "sit_start", default: false, null: false
    t.boolean "has_line", default: false, null: false
    t.string "description"
    t.index ["area_id"], name: "index_problems_on_area_id"
    t.index ["grade"], name: "index_problems_on_grade"
    t.index ["has_line"], name: "index_problems_on_has_line"
    t.index ["location"], name: "index_problems_on_location", using: :gist
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
