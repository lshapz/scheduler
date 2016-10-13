class CommandLineInterface

attr_accessor :me, :nope 

def who_am_I
  puts "What is your name?"
    input = gets.chomp
  @me = Employee.find_by(name: input)
end 

def get_nope
  puts "when can't you work? input as follows: mon1, fri2, sun1, sun2"
  @nope = gets.chomp

end 

def runner 
  who_am_I.cannot_work(get_nope)
end

end 

