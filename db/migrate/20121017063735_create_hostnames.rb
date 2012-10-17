class CreateHostnames < ActiveRecord::Migration
  def change
    create_table :hostnames do |t|
      t.string :name
      t.boolean :primary
      t.integer :host_id

      t.timestamps
    end
  end
end
