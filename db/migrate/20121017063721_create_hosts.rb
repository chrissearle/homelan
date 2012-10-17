class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :description
      t.string :ethernet_mac
      t.string :wlan_mac
      t.string :ip_address

      t.timestamps
    end
  end
end
