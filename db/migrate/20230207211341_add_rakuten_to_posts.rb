class AddRakutenToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :rakuten_toyname, :string, null: false
    add_column :posts, :rakuten_toyimage, :string, null: false
  end
end
