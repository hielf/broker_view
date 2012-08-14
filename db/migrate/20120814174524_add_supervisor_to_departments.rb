class AddSupervisorToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :supervisor, :string
  end
end
