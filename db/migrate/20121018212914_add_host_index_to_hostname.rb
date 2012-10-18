class AddHostIndexToHostname < ActiveRecord::Migration
  def change
    add_index :hostnames, :host_id
  end
end
