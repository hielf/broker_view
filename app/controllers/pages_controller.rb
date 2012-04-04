# encoding: utf-8
class PagesController < ApplicationController
  def home
    @title = "首页"
    if signed_in?
      @title = "首页"
    end
  end

  def contact
    @title = "联系"
  end
  
  def about
    @title = "关于"
  end
  
  def help
    @title = "帮助"
  end
end
