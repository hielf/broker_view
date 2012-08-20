# encoding: utf-8
module BrokersHelper
  
  def avatar
    @broker = Broker.find(params[:id])
    if !@broker.avatar.nil?
      image_tag(@broker.avatar, :alt => @broker.broker_name, :size => "90x90" )
    else
      image_tag("nobody.gif", :alt => @broker.broker_name, :size => "90x90" )
    end 
  end

end
