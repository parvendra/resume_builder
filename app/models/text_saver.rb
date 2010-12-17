require 'resume_creater.rb'
class TextSaver < ResumeCreater

  def initialize(name, age, address)
    super(name, age, address)
  end
  
  def save_to_file
    file = ""
    File.open("#{RAILS_ROOT}/public/files/#{@name.downcase.split.join("_")}.text", "w") do |file|
      file.print(IO.read("#{RAILS_ROOT}/public/files/#{@name.downcase.split.join("_")}"))
    end
    return file
  end
end
