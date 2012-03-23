# encoding: utf-8
module ApplicationHelper
  
  #return title
  def title 
    base_title = "营销综合管理"
    if @title.nil?
      base_title
    else 
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "营销综合管理" )
  end
end
