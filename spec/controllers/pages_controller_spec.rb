require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get :home
      response.should be_success
    end
    it "should have right title" do
      get :home
      response.should have_selector("title",
                                    :content => "Resume Builder | Home")
    end
  end



end
