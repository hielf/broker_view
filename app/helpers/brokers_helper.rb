# encoding: utf-8
module BrokersHelper
  
  def avatar
    @broker = Broker.find(params[:id])
    image_tag(@broker.avatar, :alt => @broker.broker_name, :size => "100x100" )
  end
  
end
