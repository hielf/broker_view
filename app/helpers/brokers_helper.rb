# encoding: utf-8
module BrokersHelper
  
  def avatar
    @broker = Broker.find(params[:id])
    image_tag(@broker.avatar, :alt => @broker.broker_name, :size => "90x90" )
  end

  # def year_month
  #   sd = Time.now.beginning_of_year.strftime("%m").to_i
  #   ed = Time.now.strftime("%m").to_i
  #   sd.upto(ed) { |month| puts month }
  # end
  
end
