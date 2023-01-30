class CreatePostAges < ActiveRecord::Migration[7.0]
  def change
    create_table :post_ages do |t|
      t.references :post, null: false, foreign_key: true
      t.references :target_age, null: false, foreign_key: true

      t.timestamps
    end
  end
end
