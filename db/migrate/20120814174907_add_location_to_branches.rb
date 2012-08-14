class AddLocationToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :location, :string
  end
end
