class BuildsController < ApplicationController
  before_filter :find_build, :only => [:dhcpd, :forward, :reverse, :destroy]

  def index
    @builds = Build.order("created_at DESC")
  end

  def new
    @build = Build.new
  end

  def create
    build = Build.new(params[:build])

    Build.build(build.comment)

    redirect_to builds_path, notice: "Build created"
  end

  def dhcpd
    send_data build.dhcpd_conf, :filename => 'dhcpd.conf'
  end

  def forward
    send_data build.zone_name, :filename => 'home.chrissearle.org'
  end

  def reverse
    send_data build.zone_ip, :filename => '1.168.192.in-addr.arpa'
  end

  def destroy
    @build.destroy

    redirect_to builds_url, notice: "Build deleted"
  end

  private

  def find_build
    @build = Build.find(params[:id])
  end
end
