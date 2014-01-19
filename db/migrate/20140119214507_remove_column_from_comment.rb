class RemoveColumnFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :author
    remove_column :comments, :post
  end
end
