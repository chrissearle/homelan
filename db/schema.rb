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

ActiveRecord::Schema.define(:version => 20121018212914) do

  create_table "builds", :force => true do |t|
    t.text     "dhcpd_conf", :null => false
    t.text     "zone_name",  :null => false
    t.text     "zone_ip",    :null => false
    t.string   "serial",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "comment"
  end

  create_table "hostnames", :force => true do |t|
    t.string   "hostname",                      :null => false
    t.boolean  "primary",    :default => false, :null => false
    t.integer  "host_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "hostnames", ["host_id"], :name => "index_hostnames_on_host_id"

  create_table "hosts", :force => true do |t|
    t.string   "description",                       :null => false
    t.string   "ethernet_mac"
    t.string   "wlan_mac"
    t.string   "ip_address"
    t.boolean  "dhcp_flag",       :default => true, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "active_flag",     :default => true, :null => false
    t.string   "wlan_ip_address"
  end

end
