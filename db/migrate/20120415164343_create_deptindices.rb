class CreateDeptindices < ActiveRecord::Migration
  def change
    create_table :deptindices do |t|
      t.integer :department_id
      t.string :month_id
      t.integer :indextype
      t.double :occursum
      t.string :remark

      t.timestamps
    end
    add_index(:deptindices, [:department_id, :month_id, :indextype], :unique => true)
  end
end
