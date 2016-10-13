class Shift < ActiveRecord::Base

  belongs_to :week
  belongs_to :employee 
  
  # def initialize(weekday: , am_or_pm: )
  #   @weekday = weekday 
  #   @am_or_pm = am_or_pm  
  #   @week = Self.week
  # end 

  # def designation 
  #   self.designation
  # end

  # def id
  #   self.id
  # end 

  def self.populate
    sequel = <<-SQL
    insert into shifts (designation) values ('mona'), ('monp'), ('tuea'), ('tuep'), ('weda'), ('wedp'), ('thua'), ('thup'), ('fria'), ('frip'), ('sata'), ('satp'), ('suna'), ('sunp')
      SQL
    DB.execute(sequel)
  end 
  
  def assign(emp)

    me = emp.id 
    shift = self.id

    thing = DB.execute("select * from employee_shifts_no_good where shift_id = #{shift} AND employee_id = #{me}")
    if thing.empty? == false
      "you can't assign me there"
    else
      DB.execute("insert into employee_shifts_assigned (employee_id, shift_id) VALUES (#{me}, #{shift})")
    end

  end 

   def see_who_is_working_me
    sql = <<-SQL
      select employees.name from employee_shifts_assigned 
      join employees on employee_shifts_assigned.employee_id = employees.id 
      join shifts on employee_shifts_assigned.shift_id = shifts.id;
    SQL
    DB.execute(sql)
  end


  # def symbolize
  #   day = weekday[0..1]
  #   time = am_or_pm[0]
  #   ":#{day}#{time}" 
  # end 
  
  # def full?
  #   if self.find_by(id: self.id)
  # end 
  
    
end
