require 'spec_helper'

describe ResumesController do
  render_views
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :name => "", :age => "", :address => "",
                  :format => "" }
      end

      it "should not create a resume" do
        lambda do
          post :create, :resume => @attr
        end.should_not change(Resume, :count)
      end
      
      it "should have the right title" do
        post :create, :resume => @attr
        response.should have_selector("title", :content => "Create Resume")
      end
      
      it "should render the 'new' page" do
        post :create, :resume => @attr
        response.should render_template('new')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :name => "New User", :age => "22",
          :address => "foobar address",
          :format => "pdf" }
      end

      it "should create a resume" do
        lambda do
          post :create, :resume => @attr
        end.should change(Resume, :count).by(1)
      end

      it "should redirect to the resume show page" do
        post :create, :resume => @attr
        response.should redirect_to(resume_path(assigns(:resume)))
      end    
      
    end
    
  end

end
