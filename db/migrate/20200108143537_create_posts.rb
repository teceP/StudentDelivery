class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :cart, null: false, foreign_key: true
      t.string :buyer
      t.string :seller

      t.timestamps
    end
  end
end
