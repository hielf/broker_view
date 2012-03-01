# encoding: utf-8
require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
    
    it "returns the right title" do
        get 'home'
        response.should have_selector("title", 
                                      :content => "#{@base_title} | 首页")
     end
    
    it "should have body text" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
    it "returns the right title" do
         get 'contact'
         response.should have_selector("title", 
                                       :content => "#{@base_title} | 联系")
    end
  end
  
  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
    it "returns the right title" do
          get 'about'
          response.should have_selector("title", 
                                        :content => "#{@base_title} | 关于")
    end
  end
  
  describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
    it "returns the right title" do
          get 'help'
          response.should have_selector("title", 
                                        :content => "#{@base_title} | 帮助")
    end
  end
end
