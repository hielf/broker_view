class BrokersController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  
  def show
    @broker = Broker.find(params[:id])
    @title  = @broker.broker_code + " - " + @broker.broker_name
    
  end
  
end
