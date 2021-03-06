class ResumeCreater
  def initialize(name, age, address)
    if(name !~ /^\w.*/ || age !~ /^\d+$/ || address !~ /\w.*/)
      raise Exception "invalid arguments"
    end
    @name = name
    @age = age
    @address = address
    File.open("#{RAILS_ROOT}/public/files/#{@name.downcase.split.join('_')}", "a") do |file|
      file.print(self)
    end
  end
  attr_reader :name, :age, :address
  def to_s
    return "Name : #{@name}\nAge : #{@age}\nAddress : #{@address}\n"
  end
  def ResumeCreater.get_object(format, *data)
    str = format.capitalize+"Saver"
    begin
      require "#{format}_saver.rb"
      writter = eval(str).new(*data)
      return writter
      rescue LoadError
      raise
      rescue Exception => e
      raise e.message
    end
  end
end
