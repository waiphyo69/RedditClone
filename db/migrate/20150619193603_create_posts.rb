class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :content
      t.integer :sub_id
      t.integer :author_id
    end
  end
end
