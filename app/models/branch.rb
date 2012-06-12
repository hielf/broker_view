# == Schema Information
#
# Table name: branches
#
#  id            :integer(4)      not null, primary key
#  code          :string(255)
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  department_id :integer(4)
#

class Branch < ActiveRecord::Base
  attr_accessible :code, :name
  belongs_to :department
  has_many :brokers
  
  default_scope   :order => 'branches.code' 
  
  # scope :from_sub_branches, lambda { |user| followed_by(user) }
  # 
  # private
  # 
  #   def self.sub_branches(department)
  #     sub_branches_ids = %(SELECT followed_id FROM relationships
  #                       WHERE follower_id = :user_id)
  #     where("user_id IN (#{following_ids}) OR user_id = :user_id",
  #           :user_id => user)
  #   end
end
