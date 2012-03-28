class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
