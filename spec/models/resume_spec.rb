require 'spec_helper'

describe Resume do

  before(:each) do
    @attr = {:name => "Example User", :age => "22", :address => "address of wxampldfkl userd", :format => "text" }
  end

  it "should create a new instance given valid attributes" do
   Resume.new(@attr)
  end
  it "should have a generate_resume method" do
    resume = Resume.new(@attr)
    resume.should respond_to(:generate_resume)
  end
end
