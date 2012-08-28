# encoding: utf-8
class Broker < ActiveRecord::Base
  belongs_to :branch
  has_many :brokerindices
  has_many :brokerrels, :dependent => :destroy,
                        :foreign_key => "rel_broker_id"
  has_many :relbrokers, :through => :brokerrels, :source => :broker
  
  default_scope :order => 'brokers.broker_code'
  
  scope :typebrokers, lambda { |brokertype| where("broker_type = ?", brokertype) } 
  
  def self.search(search)
    if search
      @brokers = Broker.limit(20).find(:all,:conditions => 
                  ['CONCAT(broker_code, \'-\', broker_name) = ? OR broker_code LIKE ? OR broker_name LIKE ?', "#{search}","%#{search}%", "%#{search}%"])
    else
      @brokers = nil
    end
  end
  
  # def branchtypebrokers(broker_type)
  #   self.find_by_broker_type(broker_type)
  # end
end
# == Schema Information
#
# Table name: brokers
#
#  id                   :integer(4)      not null, primary key
#  broker_code          :string(255)
#  broker_name          :string(255)
#  branch_id            :integer(4)
#  broker_type          :string(255)
#  gender               :string(255)
#  age                  :integer(4)
#  broker_level         :string(255)
#  broker_status        :string(255)
#  jobstatus            :string(255)
#  employee_code        :string(255)
#  open_date            :string(255)
#  close_date           :string(255)
#  certificate_type     :string(255)
#  certificate_num      :string(255)
#  certificate_addr     :string(255)
#  mobile               :string(255)
#  phone                :string(255)
#  fax                  :string(255)
#  email                :string(255)
#  birthday             :string(255)
#  bank_account         :string(255)
#  graduate_college     :string(255)
#  graduate_date        :string(255)
#  major                :string(255)
#  earliest_date        :string(255)
#  agreement_begin_date :string(255)
#  agreement_end_date   :string(255)
#  compact_no           :string(255)
#  broker_qualify_no    :string(255)
#  cert_first_date      :string(255)
#  cert_valite_date     :string(255)
#  cert_get_date        :string(255)
#  exam_pass_date       :string(255)
#  risk_balance         :float
#  broker_degree        :string(255)
#  post                 :string(255)
#  job_qualify          :string(255)
#  passed_exam          :string(255)
#  broker_qualify       :string(255)
#  zqbz                 :string(255)
#  personnel_manning    :string(255)
#  region_manager       :string(255)
#  team_name            :string(255)
#  remark               :text
#  created_at           :datetime
#  updated_at           :datetime
#  avatar               :string(255)
#

