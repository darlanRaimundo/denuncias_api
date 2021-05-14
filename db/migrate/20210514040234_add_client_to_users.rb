class AddClientToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :client, :string
  end
end
