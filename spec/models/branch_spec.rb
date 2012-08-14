# encoding: utf-8
require 'spec_helper'

describe Branch do
  
  before(:each) do
    @branch = Factory(:branch)
    @department = Factory(:department)
    @attr = { :code => "0100", :name => "营业部A", :department_id => 1 }
  end
  
  describe "branch relationships" do
    
    it "should have a department attribute" do
      @branch.should respond_to(:department)
    end
    
    it "should have the right associated department" do
      @branch.department_id.should == @department.id
      @branch.department.should == @department
    end
    
    # it "should have a relationship method " do
    #   @branch.should respond_to(:reverse_branchrels)
    # end
    
  end
  
end
# == Schema Information
#
# Table name: branches
#
#  id            :integer(4)      not null, primary key
#  code          :string(255)
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  department_id :integer(4)
#  supervisor    :string(255)
#  location      :string(255)
#  phone         :string(255)
#

