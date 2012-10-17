class Host < ActiveRecord::Base
  attr_accessible :description, :ethernet_mac, :ip_address, :wlan_mac, :dhcp_flag

  has_many :hostnames

end
