class CreateBrokerindices < ActiveRecord::Migration
  def change
    create_table :brokerindices do |t|
      t.integer :broker_id
      t.string :month_id
      t.integer :indextype
      t.float :occursum
      t.string :remark

      t.timestamps
    end
    add_index(:brokerindices, [:broker_id, :month_id, :indextype], :unique => true)
  end
end
