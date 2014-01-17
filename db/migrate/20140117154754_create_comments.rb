class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.decimal :author_id
      t.text :content

      t.timestamps
    end
  end
end
