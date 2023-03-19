class AddIndexToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_index :favorites, %i[user_id post_id], unique: true
  end
end
