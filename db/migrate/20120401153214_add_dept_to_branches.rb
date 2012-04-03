class AddDeptToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :department_id, :integer
    add_index  :branches, :department_id
  end
end
