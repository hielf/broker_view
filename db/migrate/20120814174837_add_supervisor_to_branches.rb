class AddSupervisorToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :supervisor, :string
  end
end
