require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "test", :email => "test@mail.com" }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require a email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject long name" do
    long_name = "a" * 21
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid email address" do
    addresses = %w[user@mail.com A.b@c.com aa_t@b.org]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email address" do
    addresses = %w[user@mail,com a@b d_#_g aaa@b.ccc.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid    
    end
  end
  
  it "should reject duplicate email address" do
    User.create!(@attr)
    user_with_same_email = User.new(@attr)
    user_with_same_email.should_not be_valid
  end
  
  it "should reject UPCASE email address" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_same_email = User.new(@attr)
    user_with_same_email.should_not be_valid
  end
end
