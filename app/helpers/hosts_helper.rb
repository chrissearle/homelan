module HostsHelper
  def host_exists(ip)
    !(Host.find_by_ip_address(ip).blank? && Host.find_by_wlan_ip_address(ip).blank?)
  end

end
