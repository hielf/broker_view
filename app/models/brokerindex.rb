# == Schema Information
#
# Table name: brokerindices
#
#  id         :integer(4)      not null, primary key
#  broker_id  :integer(4)
#  month_id   :string(255)
#  indextype  :integer(4)
#  occursum   :float
#  remark     :string(255)
#  created_at :datetime
#  updated_at :datetime
#
class Brokerindex < ActiveRecord::Base
  belongs_to :broker
  
  default_scope :order => 'brokerindices.month_id'
  
end
