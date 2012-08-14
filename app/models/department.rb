# == Schema Information
#
# Table name: departments
#
#  id         :integer(4)      not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  supervisor :string(255)
#  location   :string(255)
#  phone      :string(255)
#

class Department < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :branches
  has_many :deptindices
  
  default_scope   :order => 'departments.code'
end


