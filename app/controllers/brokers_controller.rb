class BrokersController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  
  def show
    @broker = Broker.find(params[:id])
    @title  = @broker.broker_code + " - " + @broker.broker_name
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @broker }
    end
  end
  
  def index
    @broker = Broker.find_by_sql ["SELECT a.* FROM brokers a WHERE branch_id = ? AND broker_type = ? ", params[:branch_id], params[:broker_type]] 
  end
  
end
