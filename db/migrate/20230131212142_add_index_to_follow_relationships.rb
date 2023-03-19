class AddIndexToFollowRelationships < ActiveRecord::Migration[7.0]
  def change
    add_index :follow_relationships, %i[following_id follower_id], unique: true
  end
end
