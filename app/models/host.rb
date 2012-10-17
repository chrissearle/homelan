class Host < ActiveRecord::Base
  attr_accessible :description, :ethernet_mac, :ip_address, :wlan_mac, :dhcp_flag, :active_flag, :wlan_ip_address, :hostname, :hostname_list

  has_many :hostnames

  def hostname
    if (hostnames.empty? || hostnames.primary_host.empty?)
      ""
    else
      hostnames.primary_host.first.hostname
    end
  end

  def hostname= h
    unless hostname.empty?
      hostnames.primary_host.each do |hn|
        hn.primary = false
        hn.save!
      end
    end

    hn = hostnames.find_or_create_by_hostname(h)
    hn.primary = true
    hn.save!
  end

  def hostname_list
    if hostnames.empty?
      ""
    else
      hostnames.other_hosts.map(&:hostname).join(",")
    end
  end

  def hostname_list= l

    unless hostnames.other_hosts.empty?
      hostnames.other_hosts.each do |hn|
        hn.destroy
      end
    end

    l.split(",").each do |h|
      hn = hostnames.find_or_create_by_hostname(h)
      hn.primary = false
      hn.save!
    end

  end
end
