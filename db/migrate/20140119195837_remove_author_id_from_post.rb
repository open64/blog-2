class RemoveAuthorIdFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :author_id
  end
end
