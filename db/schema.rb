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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20151120134428) do

  create_table "accessories", :force => true do |t|
    t.integer "profile_id",                :null => false
    t.integer "item_id",                   :null => false
    t.integer "owned",      :default => 0, :null => false
  end

  add_index "accessories", ["profile_id", "owned"], :name => "index_accessories_on_profile_id_and_owned"

  create_table "alliances", :force => true do |t|
    t.integer "profile_id",     :null => false
    t.string  "alliance_type",  :null => false
    t.integer "primary_link"
    t.integer "secondary_link"
    t.integer "tertiary_link"
  end

  create_table "arms", :force => true do |t|
    t.integer "profile_id",                :null => false
    t.integer "weapon_id",                 :null => false
    t.integer "owned",      :default => 0, :null => false
  end

  add_index "arms", ["profile_id", "owned"], :name => "index_arms_on_profile_id_and_owned"

  create_table "fighters", :force => true do |t|
    t.integer "profile_id",                :null => false
    t.integer "soldier_id",                :null => false
    t.integer "owned",      :default => 0, :null => false
  end

  add_index "fighters", ["profile_id", "owned"], :name => "index_fighters_on_profile_id_and_owned"

  create_table "generals", :force => true do |t|
    t.string   "name",                                                   :null => false
    t.integer  "attack",                                                 :null => false
    t.integer  "defense",                                                :null => false
    t.float    "e_attack",                                               :null => false
    t.float    "e_defense",                                              :null => false
    t.integer  "base_cost",         :limit => 8
    t.integer  "upkeep",            :limit => 8
    t.integer  "attack_increment",               :default => 1
    t.integer  "defense_increment",              :default => 1
    t.integer  "div_power"
    t.string   "description"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "type",                           :default => "General"
    t.string   "general_type",                   :default => "Balanced"
    t.string   "url"
    t.integer  "base_piercing",                  :default => 0
    t.integer  "base_resistance",                :default => 0
    t.string   "alliance_type"
    t.integer  "general_id"
    t.string   "bonus_type"
    t.integer  "bonus",                          :default => 0
  end

  add_index "generals", ["name"], :name => "index_generals_on_name"

  create_table "items", :force => true do |t|
    t.string   "name",                                   :null => false
    t.string   "type",                                   :null => false
    t.integer  "attack",                                 :null => false
    t.integer  "defense",                                :null => false
    t.float    "e_attack",                               :null => false
    t.float    "e_defense",                              :null => false
    t.integer  "base_cost",  :limit => 8
    t.integer  "upkeep",     :limit => 8
    t.integer  "div_power"
    t.integer  "slots",                   :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "url"
    t.integer  "piercing",                :default => 0
    t.integer  "resistance",              :default => 0
    t.integer  "general_id"
    t.string   "bonus_type"
    t.integer  "bonus",                   :default => 0
  end

  create_table "lands", :force => true do |t|
    t.string   "name",                          :null => false
    t.integer  "base_cost",        :limit => 8, :null => false
    t.integer  "income",           :limit => 8, :null => false
    t.float    "incremental_cost",              :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "url"
  end

  create_table "loadouts", :force => true do |t|
    t.string  "name",                                      :null => false
    t.string  "class_type"
    t.integer "profile_id",                                :null => false
    t.integer "general_id"
    t.integer "weapon_id"
    t.integer "shield_id"
    t.integer "helmet_id"
    t.integer "armor_id"
    t.integer "amulet_id"
    t.integer "glove_id"
    t.integer "boot_id"
    t.integer "power_id"
    t.boolean "attack_rune_on_weapon",  :default => false
    t.boolean "defense_rune_on_helmet", :default => false
    t.boolean "defense_rune_on_armor",  :default => false
    t.integer "weapon_piercing",        :default => 0
    t.integer "weapon_resistance",      :default => 0
    t.integer "glove_piercing",         :default => 0
    t.integer "glove_resistance",       :default => 0
    t.integer "armor_piercing",         :default => 0
    t.integer "armor_resistance",       :default => 0
    t.integer "helmet_piercing",        :default => 0
    t.integer "helmet_resistance",      :default => 0
    t.integer "shield_piercing",        :default => 0
    t.integer "shield_resistance",      :default => 0
    t.integer "boot_piercing",          :default => 0
    t.integer "boot_resistance",        :default => 0
    t.integer "power_piercing",         :default => 0
    t.integer "power_resistance",       :default => 0
    t.boolean "attack_rune_on_banner",  :default => false
    t.integer "banner_id"
    t.integer "banner_piercing",        :default => 0
    t.integer "banner_resistance",      :default => 0
  end

  create_table "messages", :force => true do |t|
    t.string "message_text", :limit => 2000
  end

  create_table "monsters", :force => true do |t|
    t.string   "name",                       :null => false
    t.integer  "minutes",     :default => 0
    t.string   "attack_type"
    t.integer  "div_power"
    t.string   "description"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "others", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "powers", :force => true do |t|
    t.string   "name",                                   :null => false
    t.integer  "attack",                                 :null => false
    t.integer  "defense",                                :null => false
    t.float    "e_attack",                               :null => false
    t.float    "e_defense",                              :null => false
    t.integer  "base_cost",  :limit => 8
    t.integer  "upkeep",     :limit => 8
    t.integer  "div_power"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "url"
    t.integer  "piercing",                :default => 0
    t.integer  "resistance",              :default => 0
    t.integer  "general_id"
    t.string   "bonus_type"
    t.integer  "bonus",                   :default => 0
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.integer  "attack",       :default => 0,   :null => false
    t.integer  "defense",      :default => 0,   :null => false
    t.integer  "energy",       :default => 0,   :null => false
    t.integer  "stamina",      :default => 0,   :null => false
    t.integer  "health",       :default => 0,   :null => false
    t.integer  "level",        :default => 0,   :null => false
    t.integer  "army_size",    :default => 0,   :null => false
    t.integer  "attack_rune",  :default => 0,   :null => false
    t.integer  "defense_rune", :default => 0,   :null => false
    t.integer  "health_rune",  :default => 0,   :null => false
    t.integer  "damage_rune",  :default => 0,   :null => false
    t.integer  "attack_ia",    :default => 0,   :null => false
    t.integer  "defense_ia",   :default => 0,   :null => false
    t.float    "e_attack",                      :null => false
    t.float    "e_defense",                     :null => false
    t.float    "income_bonus", :default => 1.0
    t.integer  "army_bonus"
    t.string   "cage_id"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "keep"
    t.string   "general"
    t.string   "soldier"
    t.string   "magic"
    t.string   "item"
    t.string   "land"
  end

  create_table "properties", :force => true do |t|
    t.integer "profile_id",                :null => false
    t.integer "land_id",                   :null => false
    t.integer "owned",      :default => 0, :null => false
  end

  add_index "properties", ["profile_id", "owned"], :name => "index_properties_on_profile_id_and_owned"

  create_table "recruits", :force => true do |t|
    t.integer "general_id",                   :null => false
    t.integer "profile_id",                   :null => false
    t.integer "level",         :default => 1, :null => false
    t.integer "promote_level", :default => 1
  end

  add_index "recruits", ["profile_id", "level"], :name => "index_recruits_on_profile_id_and_level"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "soldiers", :force => true do |t|
    t.string   "name",                                   :null => false
    t.integer  "attack",                                 :null => false
    t.integer  "defense",                                :null => false
    t.float    "e_attack",                               :null => false
    t.float    "e_defense",                              :null => false
    t.integer  "base_cost",  :limit => 8
    t.integer  "upkeep",     :limit => 8
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "url"
    t.integer  "general_id"
    t.string   "bonus_type"
    t.integer  "bonus",                   :default => 0
  end

  create_table "spells", :force => true do |t|
    t.integer "profile_id",                :null => false
    t.integer "power_id",                  :null => false
    t.integer "owned",      :default => 0, :null => false
  end

  add_index "spells", ["profile_id", "owned"], :name => "index_spells_on_profile_id_and_owned"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "weapons", :force => true do |t|
    t.string   "name",                                   :null => false
    t.integer  "attack",                                 :null => false
    t.integer  "defense",                                :null => false
    t.float    "e_attack",                               :null => false
    t.float    "e_defense",                              :null => false
    t.integer  "base_cost",  :limit => 8
    t.integer  "upkeep",     :limit => 8
    t.integer  "div_power"
    t.integer  "slots",                   :default => 0
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "url"
    t.integer  "piercing",                :default => 0
    t.integer  "resistance",              :default => 0
    t.integer  "general_id"
    t.string   "bonus_type"
    t.integer  "bonus",                   :default => 0
  end

end
