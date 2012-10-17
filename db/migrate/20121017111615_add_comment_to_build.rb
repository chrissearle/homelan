class AddCommentToBuild < ActiveRecord::Migration
  def change
    add_column :builds, :comment, :string
  end
end
