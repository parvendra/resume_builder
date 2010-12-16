require 'resume.rb'
require 'rubygems'
require 'pdf/writer'
class PdfSaver < ResumeCreater
  
  def initialize(name, age, address)
    super(name,age,address)
  end

  def save_to_file
    pdf = PDF::Writer.new
    pdf.select_font "Times-Roman"
    pdf.text "#{IO.read(@name)}", :font_size => 20
    File.open("#{@name}.pdf", "wb"){|file| file.write pdf.render}
    return pdf
  end
end 
