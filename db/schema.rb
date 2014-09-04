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

ActiveRecord::Schema.define(version: 20140719152849) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.boolean  "isSensitive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_listings", id: false, force: true do |t|
    t.integer "listing_id"
    t.integer "category_id"
  end

  create_table "contents", force: true do |t|
    t.integer  "listing_id"
    t.boolean  "video_avail"
    t.boolean  "video_inMkt"
    t.boolean  "photo_avail"
    t.boolean  "photo_inMkt"
    t.boolean  "profile_avail"
    t.boolean  "profile_inMkt"
    t.boolean  "dspAd_avail"
    t.boolean  "dspAd_inMkt"
    t.boolean  "logo_avail"
    t.boolean  "logo_inMkt"
    t.boolean  "url_avail"
    t.boolean  "url_inMkt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", force: true do |t|
    t.integer  "listing_id"
    t.string   "name"
    t.string   "suite"
    t.string   "street"
    t.string   "city"
    t.string   "province"
    t.string   "postalCode"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "distance"
    t.integer  "parentId"
    t.boolean  "isParent"
    t.string   "work_phone"
    t.string   "fax"
    t.text     "categories"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.integer  "ref"
    t.string   "name"
    t.string   "prov"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings_search_requests", id: false, force: true do |t|
    t.integer "listing_id"
    t.integer "search_request_id"
  end

  create_table "products", force: true do |t|
    t.integer  "listing_id"
    t.text     "video"
    t.text     "photo"
    t.text     "profile"
    t.text     "dspAd"
    t.text     "logo"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publics", force: true do |t|
    t.string   "name"
    t.string   "suite"
    t.string   "street"
    t.string   "city"
    t.string   "province"
    t.string   "postal"
    t.string   "work_phone"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_requests", force: true do |t|
    t.string   "what"
    t.string   "where"
    t.integer  "firstListing"
    t.integer  "lastListing"
    t.integer  "totalListing"
    t.integer  "pageCount"
    t.integer  "currentPage"
    t.integer  "listingPerPage"
    t.string   "prov"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
