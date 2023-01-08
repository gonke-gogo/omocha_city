class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :toy_image
      t.string :toy_movie
      t.string :toy_name, null: false
      t.text :content, null: false
      t.integer :target_age
      t.integer :shop_link
      t.string :netshop_link

      t.timestamps
    end
  end
end
