class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :description, :null => false
      t.string :ethernet_mac
      t.string :wlan_mac
      t.string :ip_address
      t.boolean :dhcp_flag, :null => false, :default => true

      t.timestamps
    end
  end
end
