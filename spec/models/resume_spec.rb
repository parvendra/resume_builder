require 'spec_helper'

describe Resume do

  before(:each) do
    @attr = {
      :name => "Example User",
      :age => "22",
      :address => "address of wxampldfkl userd",
      :format => "text"
    }
  end

  it "should create a new instance given valid attributes" do
   Resume.create! @attr
  end
  
end
