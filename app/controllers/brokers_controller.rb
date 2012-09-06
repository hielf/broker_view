# encoding: utf-8
class BrokersController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  
  def show
    @broker = Broker.find(params[:id])
    @title  = @broker.broker_code + " - " + @broker.broker_name
    @branch = @broker.branch
    @father_department = @branch.department
    @salary_months = @broker.brokerindices.limit(3).where(:indextype => 2009).reverse_order
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @broker }
    end
  end
  
  def index
    # @categories = Broker.order(:broker_code).where("broker_code LIKE ?", "#{params[:term]}")
    # render json: @categories.map(&:broker_code)
  end
  
  def relbrokers
    @title = "关联帐户"
    @broker = Broker.find(params[:id])
    @brokers = @broker.relbrokers
    render 'categories/search'
  end
end
