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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20171110051007) do
=======
ActiveRecord::Schema.define(version: 20171116050252) do

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "fName"
    t.string "lName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> 6015219c1c89fe7331ae6b2bbeba1fd6199aead7

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "fName"
    t.string "lName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", primary_key: "isbn", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.integer "pages"
    t.string "publisher"
    t.integer "copiesLeft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "categoryId"
    t.integer "authorId"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
=======
  create_table "rentals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "dateRented"
    t.date "dateDue"
    t.integer "daysLeft"
    t.boolean "isRenewed"
    t.boolean "isReturned"
    t.date "dateReturned"
    t.float "fee", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "userId"
    t.bigint "isbn"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
>>>>>>> 6015219c1c89fe7331ae6b2bbeba1fd6199aead7
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.boolean "isAdmin"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
