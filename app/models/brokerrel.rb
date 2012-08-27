# == Schema Information
#
# Table name: brokerrels
#
#  id            :integer(4)      not null, primary key
#  broker_id     :integer(4)
#  rel_broker_id :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#
class Brokerrel < ActiveRecord::Base
  belongs_to :broker,    :class_name => "Broker"
  belongs_to :relbroker, :class_name => "Broker"
  
  validates :broker_id,     :presence => true
  validates :rel_broker_id, :presence => true
end