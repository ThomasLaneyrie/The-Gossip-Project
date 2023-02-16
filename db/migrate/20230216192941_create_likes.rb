class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :gossip
      t.timestamps
    end

    add_index :likes, [:user_id, :gossiprc_id], unique: true
  end
end
