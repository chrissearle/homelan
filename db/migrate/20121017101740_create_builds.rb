class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.text :dhcpd_conf, :null => false
      t.text :zone_name, :null => false
      t.text :zone_ip, :null => false
      t.string :serial, :null => false

      t.timestamps
    end
  end
end
