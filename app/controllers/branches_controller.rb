# encoding: utf-8
class BranchesController < ApplicationController
  before_filter :authenticate
  
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
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch }
    end
  end
  
  def typebrokers
    @branch = Branch.find(params[:id])
    @brokers    = @branch.brokers
    @broker_types = @brokers.select("broker_type").group("broker_type")
    @typebrokers = Broker.where("branch_id = ? AND broker_type = ? ", params[:id], params[:broker_type]) 
    @title  = "#{params[:broker_type]}"
    @father_department = @branch.department
  end
  # def typebrokers
  #   @branch       = Branch.find(params[:id])
  #   @brokers      = @branch.gettypebroker
  #   @type_brokers = @branch.typebrokers(params[:id])
  # end
  
end