require 'spec_helper'

describe "Resumes" do

  describe "create" do

    describe "failure" do
      
      it "should not make a new resume" do
        lambda do
          visit new_path
          fill_in "Name",         :with => ""
          fill_in "Age",        :with => ""
          fill_in "Address",     :with => ""
          fill_in "Format", :with => ""
          click_button
          response.should render_template('resumes/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(Resume, :count)  
      end
    end

    describe "success" do

      it "should make a new resume" do
        lambda do
          visit new_path
          fill_in "Name",         :with => "Example User"
          fill_in "Age",        :with => "22"
          fill_in "Address",     :with => "example address"
          fill_in "format", :with => "pdf"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Resume successfully created!")
          response.should render_template('resumes/show')
        end.should change(Resume, :count).by(1)
      end
    end
    
  end
end
