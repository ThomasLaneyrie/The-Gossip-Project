class CreateJoinTableGossipTags < ActiveRecord::Migration[7.0]
  def change
    create_table :join_table_gossip_tags do |t|
      t.belongs_to :gossip
      t.belongs_to :tag
      t.timestamps
    end
  end
end
