# encoding: utf-8
class BrokerindicesController < ApplicationController
  before_filter :authenticate
  
  def broker_index
    @brokerindex =  getbrokerindex(params[:broker_id], params[:id])
    
    # gon.rabl 'app/views/deptindices/dept_index.json.rabl', as: "deptindex"
  end
  
  private
  
  def getbrokerindex(broker, type)
    @deptindex = Brokerindex.find_by_sql ["SELECT a.* FROM brokerindices a WHERE broker_id = ? and indextype = ?", broker, type]
  end
end