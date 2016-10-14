require 'pry-byebug'
class BossCli

attr_accessor :populate, :me, :nope

def self.populate
  Employee.populate
  Shift.populate
end 


def unavails 
  sql = <<-SQL
      select shifts.designation, employees.name from employee_shifts_no_good 
      join employees on employee_shifts_no_good.employee_id = employees.id 
      join shifts on employee_shifts_no_good.shift_id = shifts.id;
    SQL
  y = DB.execute(sql)
  clean_raw_data(y)
end 

def clear_avails
 DB.execute("DELETE * FROM employee_shifts_no_good")
end 

# def schedule_runner
#   monday_AM 
#   monday_PM
#   tuesday_AM
#   tuesday_PM
#   wednesday_AM
#   wednesday_PM
#   thursday_AM
#   thursday_PM
#   friday_AM
#   friday_PM
#   saturday_AM
#   saturday_PM
#   sunday_AM
#   sunday_PM
# end 


#end 


def check_avail(shift_id:, employee_id:)
    sql = <<-SQL
      select * from employee_shifts_no_good 
      where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee_id}
        SQL
    thing = DB.execute(sql)
end 


def get_employee
    input = gets.chomp
    employee = Employee.all.find_by(name: input.downcase)
    if employee == nil
        puts "nobody by that name works here, dude"
        get_employee
      end 
    employee
  end 


  
  def monday_AM 
    puts "who should work Monday morning?"
    employee = get_employee
    shift_id = 1
    thing = check_avail(shift_id: shift_id, employee_id: employee.id)
      if !thing.empty?  
        puts "they are busy, try again"
        monday_AM
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
    complete_schedule
  end 

def runner 
  #@me = who_am_I
  #@nope = get_nope
    puts "Hey, big cheese! What's on the to-do list? 1 for making next week, 2 for checking last week."
    input = gets.chomp
      case input
      when "1" || 1 
          puts "Here's what you can't do (oy gevalt):"
          unavails 
          schedule_runner
          #many other methods, then once assignments check out,  clear_avails 
      when "2" || 2
        self.complete_schedule
      else
        puts "please say 1 or 2, I'm not a good parser yet"
      end 
end

def complete_schedule
  sql = <<-SQL 
  select shifts.designation, employees.name 
    from employee_shifts_assigned join employees
    on employee_shifts_assigned.employee_id = employees.id 
    join shifts on employee_shifts_assigned.shift_id = shifts.id;
    SQL

    y = DB.execute(sql)
    clean_raw_data(y)
 end


def clean_raw_data(raw)
  raw.each do |x|
    x.delete_if do |k, v|
      k.is_a? Fixnum
    end
  end 

  #binding.pry 
  arr = []
  raw.each do |x|
    x.each do |k, v| 
      arr << v
    end
  end

  why = arr.each_slice(2).to_a
  show = why.each_with_object({}) {|x, hash| hash[x[0]] = x[1]}   
    #binding.pry 

     show.each do |k, v| 
          if k.last == "1"
            puts "#{k[0].upcase}#{k[1..-2]} morning: #{v[0].upcase}#{v[1..-1]}"
          elsif k.last == "2"
            puts "#{k[0].upcase}#{k[1..-2]} evening: #{v[0].upcase}#{v[1..-1]}"
          else
            puts "that is not a real shift"
        end 
    end
 

end 


end 

