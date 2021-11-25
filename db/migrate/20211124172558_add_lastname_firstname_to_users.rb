class AddLastnameFirstnameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :firstname, :String
    add_column :users, :lastname, :String
  end
end
