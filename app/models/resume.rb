require 'resume_creater.rb'

class Resume < ActiveRecord::Base
  
  attr_accessible :name, :age, :address, :format
  
  name_regx = /^\w.*/
  age_regx = /^\d+$/
  
  validates :name, :presence => true,
  :length => { :maximum => 50},
  :format => { :with =>  name_regx}

  validates :age, :presence => true,
  :format => { :with => age_regx }

  validates_numericality_of :age, :only_integer => true,
  :message => "can only be Integer."
  
  validates :address, :presence => true,
  :format => { :with => name_regx},
  :length => { :maximum => 100}
  
  validates :format, :presence => true,
  :length => { :maximum => 20}

  before_save :generate_resume

  private
  def generate_resume
    begin
      writter = ResumeCreater.get_object(self.format, self.name, self.age.to_s, self.address)
      writter.save_to_file
      return true
    rescue LoadError
      self.errors[:format] = "No suitable plugin found!"
      return false
    rescue Exception
      self.errors[:format] = "some error happened : #{$!}"
      return false
    end
  end
end
