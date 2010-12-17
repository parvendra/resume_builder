class ResumesController < ApplicationController
  def new
    @resume = Resume.new
    @title = "Create Resume"
  end
  def create
     @resume = Resume.new(params[:resume])
    status = @resume.save
    if status  
      flash[:success] = "Resume successfully created!"
      redirect_to @resume
    else
        @title = "Create Resume"
        render 'new'
    end
  end
  
  def show
    @resume = Resume.find_by_id(params[:id])
    @title = @resume.name
    end
  
end
  
