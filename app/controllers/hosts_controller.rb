class HostsController < ApplicationController
  before_filter :find_host, :only => [:show, :edit, :update, :destroy]

  def index
    @hosts = Host.order("description ASC").includes(:hostnames)
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(params[:host])

    if @host.save
      redirect_to hosts_path, notice: "Host created"
    else
      render :new
    end
  end

  def edit
  end

  def update
     if @host.update_attributes(params[:host])
       redirect_to hosts_path, notice: "Host updated"
     else
       render :edit
     end
   end

  def show

  end

  def destroy
    @host.destroy

    redirect_to hosts_url, notice: "Host deleted"
  end

  private

  def find_host
    @host = Host.find(params[:id])
  end
end
