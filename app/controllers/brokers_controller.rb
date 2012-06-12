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
  
end
