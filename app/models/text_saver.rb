require 'resume.rb'
class TextSaver < ResumeCreater

  def initialize(name, age, address)
    super(name, age, address)
  end
  
  def save_to_file
    file = ""
    File.open("#{@name}.txt", "w") do |file|
      file.print(IO.read(@name))
    end
    return file
  end
end
