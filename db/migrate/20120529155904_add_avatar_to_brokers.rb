class AddAvatarToBrokers < ActiveRecord::Migration
  def change
    add_column :brokers, :avatar, :string
  end
end
