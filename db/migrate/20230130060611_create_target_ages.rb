class CreateTargetAges < ActiveRecord::Migration[7.0]
  def change
    create_table :target_ages do |t|
      t.string :name

      t.timestamps
    end
  end
end
