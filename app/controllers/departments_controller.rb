# encoding: utf-8
class DepartmentsController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  def index
    @departments = Department.all
    @department  = Department.find_by_code(0000)
    @title       = "选择分公司"
    @timeperiod  = time_period(time)
    @department_num = @departments.count.to_i-1
    @branches    = Branch.all
    @branch_num  = @branches.count.to_i
    @direct_branch_num = Department.find_by_code(0000).branches.count.to_i
    
    if @department.deptindices.order("month_id DESC").find_by_indextype(1005).nil?
      @broker_a_num = 0  
    else 
      @broker_a_num = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1005).occursum.round
    end
    if @department.deptindices.order("month_id DESC").find_by_indextype(1006).nil?
      @broker_b_num = 0  
    else 
      @broker_b_num = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1006).occursum.round
    end
    if @department.deptindices.order("month_id DESC").find_by_indextype(1007).nil?
       @broker_c_num = 0  
     else 
       @broker_c_num = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1007).occursum.round
     end
     if @department.deptindices.order("month_id DESC").find_by_indextype(1008).nil?
       @broker_d_num = 0  
     else 
       @broker_d_num = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1008).occursum.round
     end
     @broker_num = @broker_a_num + @broker_b_num + @broker_c_num + @broker_d_num
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departments }
    end
  end

  def show
    @department = Department.find(params[:id])
    @title      = @department.name
    @branches   = @department.branches
    if @department.deptindices.order("month_id DESC").find_by_indextype(1005).nil?
      @broker_a_num = 0  
    else 
      @broker_a_num = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1005).occursum.round
    end
    if @department.deptindices.order("month_id DESC").find_by_indextype(1006).nil?
      @broker_b_num = 0  
    else 
      @broker_b_num = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1006).occursum.round
    end
    if @department.deptindices.order("month_id DESC").find_by_indextype(1007).nil?
       @broker_c_num = 0  
     else 
       @broker_c_num = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1007).occursum.round
     end
     if @department.deptindices.order("month_id DESC").find_by_indextype(1008).nil?
       @broker_d_num = 0  
     else 
       @broker_d_num = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1008).occursum.round
     end
     @broker_num = @broker_a_num + @broker_b_num + @broker_c_num + @broker_d_num
     
     if @department.deptindices.order("month_id DESC").find_by_indextype(1003).nil?
       @total_branch_cust = 0  
     else 
       @total_branch_cust = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1003).occursum.round
     end
    
    if @department.deptindices.order("month_id DESC").find_by_indextype(1004).nil?
      @total_broker_cust = 0  
    else 
      @total_broker_cust = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1004).occursum.round
    end
    @total_cust = @total_broker_cust + @total_branch_cust
    
    if @department.deptindices.order("month_id DESC").find_by_indextype(1012).nil?
      @total_avai_cust = 0  
    else 
      @total_avai_cust = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1012).occursum.round
    end
    if @department.deptindices.order("month_id DESC").find_by_indextype(1013).nil?
      @total_broker_avai_cust = 0  
    else 
      @total_broker_avai_cust = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1013).occursum.round
    end
    
    if @department.deptindices.order("month_id DESC").find_by_indextype(1001).nil?
      @total_commis = 0  
      @total_commis_last = 0
    else 
      @total_commis = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1001).occursum
      @total_commis_last = @department.deptindices.unscoped.order("month_id   DESC").limit(1).offset(1).find_by_indextype(1001).occursum
    end
    if @department.deptindices.order("month_id DESC").find_by_indextype(1002).nil?
       @total_broker_commis = 0  
    else 
       @total_broker_commis = @department.deptindices.unscoped.order("month_id DESC").find_by_indextype(1002).occursum
    end
    if @total_commis_last == 0
     @increase_rate = 0
    else
     @increase_rate = ((@total_commis - @total_commis_last) / @total_commis_last)*100
    end
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department }
    end
  end
  
end