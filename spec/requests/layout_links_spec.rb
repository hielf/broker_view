# encoding: utf-8
require 'spec_helper'

describe "LayoutLinks" do
  # describe "GET /layout_links" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get layout_links_index_path
  #     response.status.should be(200)
  #   end
  # end
  
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "首页")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "联系")
   end
   
   it "should have a About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "关于")
   end
   
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "帮助")
  end
end
