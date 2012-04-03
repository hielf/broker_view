# == Schema Information
#
# Table name: departments
#
#  id         :integer(4)      not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Department < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :branches
  
  default_scope   :order => 'departments.code'
end


