class AddWlanIpToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :wlan_ip_address, :string
  end
end
