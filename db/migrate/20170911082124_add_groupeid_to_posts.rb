class AddGroupeidToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :group_id, :integer
  end
end
