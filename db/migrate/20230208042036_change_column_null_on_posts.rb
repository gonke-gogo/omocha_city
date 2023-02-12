class ChangeColumnNullOnPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :posts, :netshop_link, false
  end
end
