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

ActiveRecord::Schema.define(version: 2018_10_19_132304) do

  create_table "avenues", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "n_lane"
    t.bigint "junction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["junction_id"], name: "index_avenues_on_junction_id"
  end

  create_table "counting_items", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "hour"
    t.string "type_vehicle"
    t.string "turn"
    t.bigint "lanes_count_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lanes_count_id"], name: "index_counting_items_on_lanes_count_id"
  end

  create_table "junctions", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_junctions_on_project_id"
  end

  create_table "lanes_counts", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "lane"
    t.bigint "user_id"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_lanes_counts_on_session_id"
    t.index ["user_id"], name: "index_lanes_counts_on_user_id"
  end

  create_table "organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "dia"
    t.string "mes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "sessions", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "dia"
    t.string "mes"
    t.string "started_at"
    t.string "finished_at"
    t.bigint "junction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["junction_id"], name: "index_sessions_on_junction_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "username"
    t.string "password"
    t.string "role"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  add_foreign_key "avenues", "junctions"
  add_foreign_key "counting_items", "lanes_counts"
  add_foreign_key "junctions", "projects"
  add_foreign_key "lanes_counts", "sessions"
  add_foreign_key "lanes_counts", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "sessions", "junctions"
  add_foreign_key "users", "organizations"
end
