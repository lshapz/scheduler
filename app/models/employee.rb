class Employee < ActiveRecord::Base

  has_many :shifts
  

  def get_nope
    @nope = gets.chomp
  end 
  
  def self.populate
     DB.execute("insert into employees (name) values ('frank'), ('nicole'), ('ricardo'), ('tony')")
  end 

  
  def cannot_work(nope)

    nah = nope.split(", ")
    me = self.id 
    # @nope = nope
    # nope.each {|x|
    #    if self.shift_hash.flatten.designation == "x" 
    #     self.shift_hash.flatten.find_by(designation: "x") = true
    #    end}
       #undefined method `each' for nil:NilClass
       #nicole.shift_hash.first.first.designation finds it
       #nicole.shift_hash.flatten.first.designation finds it 
    #nah.each {|x| insert into employee_shifts_no_good (shift_id, employee_id) VALUES (x.id where x == shift.designation) (self.id)}
    nah.each {|x|   shift =  Shift.find_by(designation: x)
      shift = shift.id
        DB.execute ("insert into employee_shifts_no_good (employee_id, shift_id) VALUES (#{me}, #{shift})")
    } 
  end 

  def see_when_you_cannot_work
    me = self.id

    sql = <<-SQL
      select shifts.designation, employees.name from employee_shifts_no_good 
 where  shifts.id;
    SQL

#     Employee
#        .select('shifts.designation, employees.name')
#       .joins(:employee_shifts_no_good)
#       .find_by('people.name' => 'John') # this should be the last
    DB.execute(sql)
  end



  def see_when_you_are_assigned
    sql = <<-SQL
      select shifts.designation from employee_shifts_assigned 
      join employees on employee_shifts_assigned.employee_id = employees.id 
      join shifts on employee_shifts_assigned.shift_id = shifts.id;
    SQL
    DB.execute(sql)
  end

  # def shift_hash
  #   y = {}
  #   Shift.all.each {|x| 
  #     y[x] = nil 
  #   }
  #   y
  # end 


end 