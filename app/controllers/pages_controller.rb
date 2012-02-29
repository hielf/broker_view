# encoding: utf-8
class PagesController < ApplicationController
  def home
    @title = "首页"
  end

  def contact
    @title = "联系"
  end
  
  def about
    @title = "关于"
  end
end
