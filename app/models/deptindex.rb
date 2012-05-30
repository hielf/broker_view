# == Schema Information
#
# Table name: deptindices
#
#  id            :integer(4)      not null, primary key
#  department_id :integer(4)
#  month_id      :string(255)
#  indextype     :integer(4)
#  occursum      :float(19)
#  remark        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Deptindex < ActiveRecord::Base
  belongs_to :department
  
  scope :matchbalance, where(:indextype => 1001)
  scope :commis, where(:indextype => 1002)
  
  default_scope   :order => 'deptindices.month_id'
  
  # private 
  # 
  # def self.total_sum(dept, month)
  #   where("month_id = :month AND department_id = :dept", :month => month, 
  #                                                        :dept => dept).sum(:occursum)
  # end
  # 
  # def self.total_on(month)
  #   where("month_id = ?", month).sum(:occursum)
  # end
  
end

