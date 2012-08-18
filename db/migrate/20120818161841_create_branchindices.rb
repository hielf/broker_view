class CreateBranchindices < ActiveRecord::Migration
  def change
    create_table :branchindices do |t|
      t.integer :branch_id
      t.string :month_id
      t.integer :indextype
      t.float :occursum
      t.string :remark

      t.timestamps
    end
    add_index(:branchindices, [:branch_id, :month_id, :indextype], :unique => true)
  end
end
