class ResumesController < ApplicationController
  def new
    @resume = Resume.new({})
    @title = "Create Resume"
  end

end
