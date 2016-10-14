



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
