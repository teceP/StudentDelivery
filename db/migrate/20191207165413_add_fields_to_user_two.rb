class AddFieldsToUserTwo < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :subject, :string
    add_column :users, :karma, :integer
  end
end
