class AddUserToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages,  :user_email, :string
  end
end
