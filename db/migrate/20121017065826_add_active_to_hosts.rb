class AddActiveToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :active_flag, :boolean, :default => true, :null => false
  end
end
