class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title
      t.string :description
      t.integer :moderator_id
    end
    add_index :subs, :title
    add_index :subs, :description
    add_index :subs, :moderator_id
  end
end
