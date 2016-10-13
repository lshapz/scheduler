require 'pry-byebug'
class BossCli

attr_accessor :populate, :me, :nope

# def self.populate
#   Employee.populate
#   Shift.populate
# end 

def unavails 
  sql = <<-SQL
      select shifts.designation, employees.name from employee_shifts_no_good 
      join employees on employee_shifts_no_good.employee_id = employees.id 
      join shifts on employee_shifts_no_good.shift_id = shifts.id;
    SQL
  y = DB.execute(sql)
  
  y.each {|x| x.each {|k, v| if k == "designation" || k == "name" puts x[k]}}
end 

def runner 
  #@me = who_am_I
  #@nope = get_nope
  unavails 
  puts "oy gevalt"
end

end 

