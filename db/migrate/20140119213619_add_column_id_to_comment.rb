class AddColumnIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :author_id, :integer
    add_column :comments, :post_id, :integer
  end
end
