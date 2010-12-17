require 'resume_creater.rb'
require 'rubygems'
require 'pdf/writer'
class PdfSaver < ResumeCreater
  
  def initialize(name, age, address)
    super(name,age,address)
  end

  def save_to_file
    pdf = PDF::Writer.new
    pdf.select_font "Times-Roman"
    text = IO.readlines("#{RAILS_ROOT}/public/files/#{@name.downcase.split.join("_")}")
    pdf.text text, :font_size => 20
    File.open("#{RAILS_ROOT}/public/files/#{@name.downcase.split.join("_")}.pdf", "wb"){|file| file.write pdf.render}
    return pdf
  end
end 
