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
  
  it "should have a Sing up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "注册")
  end
  
  it "should have a Sing up page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => "登录")
  end
  
  
  it "should have the right links on the layout" do
    visit root_path 
    response.should have_selector('title', :content => "首页")
    click_link "关于"
    response.should have_selector('title', :content => "关于")
    click_link "联系"
    response.should have_selector('title', :content => "联系")
    click_link "帮助"
    response.should have_selector('title', :content => "帮助")
    click_link "首页"
    response.should have_selector('title', :content => "首页")
    click_link "注册"
    response.should have_selector('title', :content => "注册")
    response.should have_selector('a>img')
    # response.should have_selector('a[href="/"]>img')
  end
  
  it "should have a breadcrumb bar links on the layout" do
    visit root_path
    response.should have_selector("a", :href => departments_path )
  end
  
  describe "when not signed in" do
    it "should have a sign in link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "登录" )
    end
  end
  
  describe "when signed in" do
    
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in "email",    :with => @user.email
      fill_in "密码",       :with => @user.password
      click_button
    end
    
    it "should have a sign out link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "退出" )
    end
    
    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "个人资料" )
    end
    
    it "should have a settings link" do
      visit root_path
      response.should have_selector("a", :href => edit_user_path(@user),
                                         :content => "设置" )
    end
    
    it "should have a settings link" do
      visit root_path
      response.should have_selector("a", :href => users_path,
                                         :content => "用户" )
    end
  end
end
