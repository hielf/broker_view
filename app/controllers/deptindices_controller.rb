# encoding: utf-8
class DeptindicesController < ApplicationController
  before_filter :authenticate
  
  def dept_index
    @deptindex =  getdeptindex(params[:department_id], params[:id])
    
    # gon.rabl 'app/views/deptindices/dept_index.json.rabl', as: "deptindex"
  end
  
  private
  
  def getdeptindex(dept, type)
    @deptindex = Deptindex.find_by_sql ["SELECT a.* FROM deptindices a WHERE department_id = ? and indextype = ?", dept, type]
  end
end
