# encoding: utf-8
class BranchesController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  
  def index
    @branches = Branch.all # .order("code").paginate(:page => params[:page]).per_page(20)
    @title    = "选择营业部"
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branches }
    end
  end

  def show
    @branch     = Branch.find(params[:id])
    @title      = @branch.name
    @father_department = @branch.department
    @brokers    = @branch.brokers
    @broker_types = @brokers.select("broker_type").group("broker_type")
    
    if @branch.branchindices.order("month_id DESC").find_by_indextype(1005).nil?
      @broker_a_num = 0  
    else 
      @broker_a_num = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1005).occursum.round
    end
    if @branch.branchindices.order("month_id DESC").find_by_indextype(1006).nil?
      @broker_b_num = 0  
    else 
      @broker_b_num = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1006).occursum.round
    end
    if @branch.branchindices.order("month_id DESC").find_by_indextype(1007).nil?
       @broker_c_num = 0  
     else 
       @broker_c_num = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1007).occursum.round
     end
     if @branch.branchindices.order("month_id DESC").find_by_indextype(1008).nil?
       @broker_d_num = 0  
     else 
       @broker_d_num = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1008).occursum.round
     end
     @broker_num = @broker_a_num + @broker_b_num + @broker_c_num + @broker_d_num
     
     if @branch.branchindices.order("month_id DESC").find_by_indextype(1003).nil?
       @total_branch_cust = 0  
     else 
       @total_branch_cust = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1003).occursum.round
     end
    
    if @branch.branchindices.order("month_id DESC").find_by_indextype(1004).nil?
      @total_broker_cust = 0  
    else 
      @total_broker_cust = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1004).occursum.round
    end
    @total_cust = @total_broker_cust + @total_branch_cust
    
    if @branch.branchindices.order("month_id DESC").find_by_indextype(1012).nil?
      @total_avai_cust = 0  
    else 
      @total_avai_cust = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1012).occursum.round
    end
    if @branch.branchindices.order("month_id DESC").find_by_indextype(1013).nil?
      @total_broker_avai_cust = 0  
    else 
      @total_broker_avai_cust = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1013).occursum.round
    end
    
    if @branch.branchindices.order("month_id DESC").find_by_indextype(1001).nil?
      @total_commis = 0  
      @total_commis_last = 0
    else 
      @total_commis = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1001).occursum
      @total_commis_last = @branch.branchindices.unscoped.order("month_id   DESC").limit(1).offset(1).find_by_indextype(1001).occursum
    end
    if @branch.branchindices.order("month_id DESC").find_by_indextype(1002).nil?
       @total_broker_commis = 0  
    else 
       @total_broker_commis = @branch.branchindices.unscoped.order("month_id DESC").find_by_indextype(1002).occursum
    end
    if @total_commis_last == 0
     @increase_rate = 0
    else
     @increase_rate = ((@total_commis - @total_commis_last) / @total_commis_last)*100
    end    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch }
    end
  end
  
  def typebrokers
    @branch = Branch.find(params[:id])
    @brokers    = @branch.brokers
    @broker_types = @brokers.select("broker_type").group("broker_type")
    @typebrokers = Broker.where("branch_id = ? AND broker_type = ? ", params[:id], params[:broker_type]).paginate(:page => params[:page]).per_page(10)
    @title  = "#{params[:broker_type]}"
    @father_department = @branch.department
  end
  # def typebrokers
  #   @branch       = Branch.find(params[:id])
  #   @brokers      = @branch.gettypebroker
  #   @type_brokers = @branch.typebrokers(params[:id])
  # end
  
end