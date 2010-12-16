require 'resume_creater.rb'

class Resume < ActiveRecord::Base
  
  attr_accessor(:name, :age, :address, :format)
  def initialize(attr)
    @name = (attr[name] ||= "")
    @age = (attr[age] ||= "")
    @address = (attr[address] ||= "")
    @format = (attr[format] ||= "")
 end
 def generate_resume
   begin
     writter = ResumeCreater.get_object(@format, @name, @age, @address)
     writter.save_to_file
   rescue LoadError
     return  "Unable to find plugin to save in given format"
   rescue Exception
     return  "Given data is not in valid format"
   end
 end
 
      end
