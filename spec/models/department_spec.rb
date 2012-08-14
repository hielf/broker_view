require 'spec_helper'

describe Department do
  
  before(:each) do
    @department = Factory(:department)
    @branch = Factory(:branch)
  end
  
  describe "department relationships" do
    
    it "should have a branch attribute" do
      @department.should respond_to(:branches)
    end
    
    # it "should have the right associated branches" do
    #   @department.branches.should == @branch
    # end
    
    # it "should have a relationship method " do
    #   @department.should respond_to(:branchrels)
    # end
    
    # it "should have a sub-branch method" do
    #   @department.should respond_to(:branches)
    # end
    
    # it "should have relationship" do
    #   
    # end
  end
  
end
# == Schema Information
#
# Table name: departments
#
#  id         :integer(4)      not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  supervisor :string(255)
#  location   :string(255)
#  phone      :string(255)
#

