module ApplicationHelper
    def title
    base_title = "Resume Builder"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    logo = image_tag("rails.png", :alt => "Resumebuilder", :class => "round")
  end

  
end
