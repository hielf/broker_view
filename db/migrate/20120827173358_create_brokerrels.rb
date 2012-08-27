class CreateBrokerrels < ActiveRecord::Migration
  def change
    create_table :brokerrels do |t|
      t.integer :broker_id
      t.integer :rel_broker_id

      t.timestamps
    end
    add_index(:brokerrels, :broker_id)
  end
end
