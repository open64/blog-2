class AddColumnToComment < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.rename :author_id, :author
      t.rename :post_id, :post
    end
  end
end
