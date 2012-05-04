# encoding: utf-8
class DeptindicesController < ApplicationController
  # before_filter :authenticate
  def index
    @deptmatchbalance =  getdeptindex(params[:department_id], 1001)
    @deptcommis =  getdeptindex(params[:department_id], 1002)
    
    gon.rabl 'app/views/deptindices/index.json.rabl', as: "deptindex"
  end
  
  # private
  # 
  # def getdeptindex(dept, type)
  #   @deptindex = Deptindex.find_by_sql ["SELECT a.* FROM deptindices a WHERE department_id = ? and indextype = ?", dept, type]
  # end
end
