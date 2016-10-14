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

def schedule_runner
  monday_AM 
  monday_PM
  tuesday_AM
  tuesday_PM
  wednesday_AM
  wednesday_PM
  thursday_AM
  thursday_PM
  friday_AM
  friday_PM
  saturday_AM
  saturday_PM
  sunday_AM
  sunday_PM
end 

def monday_AM
  puts "who should work Monday morning?"
  input = gets.chomp
    #check input 
    shift_id = 1 
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 

def monday_PM
  puts "who should work Monday evening?"
  input = gets.chomp
    #check input 
    shift_id = 2
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 

  end 


def tuesday_AM
  puts "who should work Tuesday morning?"
  input = gets.chomp
    #check input 
    shift_id = 3
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 

def tuesday_PM
  puts "who should work Tuesday evening?"
  input = gets.chomp
    #check input 
    shift_id = 4
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 


def wednesday_AM
  puts "who should work Wednesday morning?"
    input = gets.chomp
    #check input 
    shift_id = 5
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 

  end 


def wednesday_PM
  puts "who should work Wednesday evening?"
  input = gets.chomp
    #check input 
    shift_id = 6
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 

def thursday_AM
  puts "who should work Thursday morning?"
  input = gets.chomp
    #check input 
    shift_id = 7
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 


def thursday_PM
  puts "who should work Thursday evening?"
  input = gets.chomp
    #check input 
    shift_id = 8
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 


def friday_AM
  puts "who should work Friday morning?"
  input = gets.chomp
    #check input 
    shift_id = 9 
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 

  end 

def friday_PM
  puts "who should work Friday evening?"
  input = gets.chomp
    #check input 
    shift_id = 10
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 

def saturday_AM
  puts "who should work Saturday morning?"
  input = gets.chomp
    #check input 
    shift_id = 11
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 


def saturday_PM
  puts "who should work Saturday evening?"
  input = gets.chomp
    #check input 
    shift_id = 12 
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 



def sunday_AM
  puts "who should work Sunday morning?"
  input = gets.chomp
    #check input 
    shift_id = 13
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
  end 


def sunday_PM
  puts "who should work Sunday evening?"
  input = gets.chomp
    #check input 
    shift_id = 14
        employee = Employee.all.find_by(name: input.downcase)
        sql = <<-SQL
          select * from employee_shifts_no_good 
          where employee_shifts_no_good.shift_id = #{shift_id} AND employee_shifts_no_good.employee_id = #{employee.id}
        SQL
    thing = DB.execute(sql)

   #binding.pry
      if employee == nil
        puts "nobody by that name works here, dude"
        #failure statement/restart self?
      elsif !thing.empty?  
        puts "they are busy, try again"
      else 
        DB.execute("insert into employee_shifts_assigned (shift_id, employee_id) values (#{shift_id}, #{employee.id})")
      end 
      end 
  end 


#end 


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

