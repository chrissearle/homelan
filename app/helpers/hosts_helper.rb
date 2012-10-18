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

    format_line(icon, "#{ip}#{hostname}", status)
  end

  def format_line(icon, text, tooltip)
    "<a rel='tooltip' title='#{tooltip}'><i class='#{icon}'></i> #{text}</a>".html_safe
  end

  def format_hostname(hostname)
    hn = Hostname.find_by_hostname(hostname)

    host = nil
    icon = "icon-ok"
    status = "Available"

    unless hn.blank?
      host = hn.host
      if (host.active_flag?)
        icon = "icon-star"
        status = "Active"
      else
        icon = "icon-off"
        status = "Inactive"
      end
    end

    format_line(icon, hostname, status)
  end
end
