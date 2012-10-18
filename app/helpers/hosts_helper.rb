module HostsHelper
  def format_ip_address(quad)
    ip = "#{NETWORK_PREFIX}#{quad}"

    host = Host.find_by_ip_address(ip)
    wlan = Host.find_by_wlan_ip_address(ip)

    icon = "icon-ok"
    status = "Available"
    hostname = ""

    unless host.blank?
      hostname = " - #{host.hostname}"
      if host.active_flag?
        icon = "icon-star"
        status = "Wired"
      else
        icon = "icon-off"
        status = "Wired (inactive)"
      end
    end

    unless wlan.blank?
      hostname = " - #{wlan.hostname}"
      if wlan.active_flag?
        icon = "icon-signal"
        status = "Wireless"
      else
        icon = "icon-off"
        status = "Wireless (inactive)"
      end
    end

    "<a rel='tooltip' title='#{status}'><i class='#{icon}'></i> #{ip}#{hostname}</a>".html_safe
  end
end
