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
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch }
    end
  end
  
end