# == Schema Information
#
# Table name: branches
#
#  id         :integer(4)      not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Branch < ActiveRecord::Base
  attr_accessible :code, :name
  
  default_scope :order => 'branch.code' 
end
