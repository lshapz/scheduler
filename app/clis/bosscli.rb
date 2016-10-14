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


# def check_avail(shift_id:, employee_id:)
#     sql = <<-SQL
#       select * from employee_shifts_no_good 
#       where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee_id}
#         SQL
#     thing = DB.execute(sql)
# end 


def get_employee
    input = gets.chomp
    employee = Employee.all.find_by(name: input.downcase)
    if employee == nil
        puts "nobody by that name works here, dude"
        get_employee
      end 
    employee
  end 

  def get_shift
      input = gets.chomp 
       #binding.pry
      shift = Shift.all.find_by(designation: input.downcase)

    if shift == nil 
      puts "we are not open then"
        get_shift
      end 
    shift
  end 


def assign
  puts "what shift do you want to assign? format as mon1, fri2, etc."
    shift = get_shift
  # if shift.am_I_booked == true 
  #     puts "no, you did that one."
  # else
  puts "who do you want to put there?"
    employee = get_employee
  #end 

   if employee.am_I_free(shift) == false 
      puts "they are busy, try again"
        assign
    else 
    DB.execute("insert into employee_shifts_assigned (employee_id, shift_id) VALUES (#{employee.id}, #{shift.id})")
      #binding.pry
    self.complete_schedule
  end 

end 

def schedule_runner
  assign 
  puts "more assignments? yes or Y for yes, anything else means no"
  input = gets.chomp
    if input == "yes" || input == "Y" || input == "y"
        schedule_runner
    else
      self.complete_schedule
        if self.complete_schedule.length > 14 
          puts "you have too many workers, btw"
        end 
    end 
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
  show = why.each_with_object({}) {|x, hash| 
      if hash.keys.include?(x[0])
        hash[x[0]]
        hash[x[0]] << x[1]
      else
         hash[x[0]] = [x[1]]
      end
       }   
    #binding.pry 
     show.each do |k, v| 
          if k.last == "1"
            puts "#{k[0].upcase}#{k[1..-2]} morning: #{v}"
          elsif k.last == "2"
            puts "#{k[0].upcase}#{k[1..-2]} evening: #{v}"
          else
            puts "that is not a real shift"
        end 
    end
 

end 


end 

