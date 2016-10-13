require 'pry-byebug'
class EmployeeCLI

attr_accessor :populate, :me, :nope

def self.populate
  Employee.populate
  Shift.populate
end 

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
  #@me = who_am_I
  #@nope = get_nope
  EmployeeCLI.populate
  who_am_I.cannot_work(get_nope)
  puts "thanks"
end

end 

