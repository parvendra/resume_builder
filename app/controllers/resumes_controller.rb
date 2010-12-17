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

  def download
    @resume = Resume.find_by_id(params[:id])
  #  redirect_to root_url+"files/#{@resume.name.downcase.split.join("_")}.#{@resume.format}",
  #  :content_type => "#{@resume.format}"
    
    render :file => Rails.root.to_s+"/public/files/#{@resume.name.downcase.split.join("_")}.#{@resume.format}",
    :layout => false, :content_type => "application/#{@resume.format}"
    
  end
  
end
  
