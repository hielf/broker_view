class AddLocationToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :location, :string
  end
end
