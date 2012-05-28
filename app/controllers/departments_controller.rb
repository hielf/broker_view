# encoding: utf-8
class DepartmentsController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  def index
    @departments = Department.all
    @title    = "选择分公司"
    @timeperiod = time_period(time)
    @department_num = @departments.count.to_i-1
    @branches = Branch.all
    @branch_num = @branches.count.to_i
    @direct_branch_num = Department.find_by_code(0000).branches.count.to_i

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @departments }
    # end
  end

  def show
    @department = Department.find(params[:id])
    @title      = @department.name
    @branches   = @department.branches
    
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @department }
    # end
  end
  
end