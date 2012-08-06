# encoding: utf-8
class CategoriesController < ApplicationController
  def index
      if params[:term]
        @categories = Broker.limit(10).find(:all,:conditions => 
                      ['broker_code LIKE ? OR broker_name LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%"])
      else
        @categories = Broker.all
      end

      respond_to do |format|  
        format.html # index.html.erb  
        # Here is where you can specify how to handle the request for "/people.json"
        format.json { render json: @categories.to_json } # { render :json => @categories.map(&(:broker_code))}
      end
  end
  
  def search
    @title = "搜索结果"
    if !params[:categories][:category_name].nil?
      @brokers = Broker.search(params[:categories][:category_name])
    end
  end
end
