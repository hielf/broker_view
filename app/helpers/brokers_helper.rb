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
  
  def level_detect(month)
    prev_month = (month.to_s + "01").to_date.prev_month.strftime("%Y%m")
    @broker = Broker.find(params[:id])
    @current_level = @broker.brokerindices.where(:indextype => '6001', :month_id => month).first.occursum.to_i
    @previous_level = @broker.brokerindices.where(:indextype => '6001', :month_id => prev_month).last.occursum.to_i
    if @current_level > @previous_level
      image_tag("level_up.gif", :alt => "升级", :size => "110x111" )
    elsif @current_level < @previous_level
      image_tag("level_down.gif", :alt => "降级", :size => "110x111" )
    else
      image_tag("level_remain.gif", :alt => "维持", :size => "110x111" )
    end
  end
  
  def broker_salary(month)
    @broker = Broker.find(params[:id])
    @broker_salary = @broker.brokerindices.where(:month_id => month)
  end
end
