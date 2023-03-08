class ChangeColumnToNotNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :posts, :rakuten_toyname, true
    change_column_null :posts, :rakuten_toyimage, true
    change_column_null :posts, :netshop_link, true
  end

  def down
    change_column_null :posts, :rakuten_toyname, false
    change_column_null :posts, :rakuten_toyimage, false
    change_column_null :posts, :netshop_link, false
  end
end
