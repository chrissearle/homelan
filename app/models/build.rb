class Build < ActiveRecord::Base
  attr_accessible :comment

  def self.build(comment)
    build = Build.new
    build.comment = comment
    build.serial = DateTime.now.strftime("%Y%m%d%H%M%S")
    build.zone_ip = build_reverse(build.serial)
    build.zone_name = build_forward(build.serial)
    build.dhcpd_conf = build_dhcp

    build.save!
  end

private

  def self.build_dhcp
    @ethernet_hosts = Host.wired.in_dhcp.active
    @wlan_hosts = Host.wireless.in_dhcp.active

    template = ERB.new get_template("dhcpd.conf"), nil, "%"
    template.result(binding)
  end

  def self.build_forward(serial)
    @named_hosts = Host.active.in_named
    @serial = serial

    template = ERB.new get_template("named_name"), nil, ">"
    template.result(binding)
  end

  def self.build_reverse(serial)
    @named_hosts = Host.active.in_named
    @serial = serial

    template = ERB.new get_template("named_ip"), nil, ">"
    template.result(binding)
  end

  def self.get_template(filename)
    File.new("#{File.dirname(__FILE__)}/../templates/#{filename}.erb").read
  end
end
