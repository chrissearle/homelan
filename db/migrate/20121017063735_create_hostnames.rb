class CreateHostnames < ActiveRecord::Migration
  def change
    create_table :hostnames do |t|
      t.string :hostname, :null => false
      t.boolean :primary, :null => false, :default => false
      t.integer :host_id

      t.timestamps
    end
  end
end
