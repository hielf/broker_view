# encoding: utf-8
class BranchindicesController < ApplicationController
  before_filter :authenticate
  
  def branch_index
    @branchindex =  getbranchindex(params[:branch_id], params[:id])
  end
  
  private
  
  def getbranchindex(dept, type)
    @branchindex = Branchindex.find_by_sql ["SELECT a.* FROM branchindices a WHERE branch_id = ? and indextype = ?", dept, type]
  end
end
