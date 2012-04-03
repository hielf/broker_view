# encoding: utf-8
class DepartmentsController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  def index
    @departments = Department.all
    @title    = "选择分公司"
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departments }
    end
  end

  def show
    @department = Department.find(params[:id])
    @title  = @department.name
    @branches = @department.branches
    
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @department }
    # end
  end
  
end