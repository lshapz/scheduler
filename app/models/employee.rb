class Employee < ActiveRecord::Base

  has_many :shifts
  
  attr_accessor :cannot_work, :name, :id, :shift_hash, :nope

  def get_nope
    @nope = gets.chomp
  end 

  def self.populate
     DB.execute("insert into employees (name) values ('frank'), ('nicole'), ('ricardo'), ('tony')")
  end 
  
  def cannot_work(*nope)
    @nope = nope
    nope.each {|x|
       if self.shift_hash.flatten.designation == "x" 
        self.shift_hash.flatten.find_by(designation: "x") = true
       end}
    #nah.each {|x| insert into employee_shifts_no_good (shift_id, employee_id) VALUES (x.id where x == shift.designation) (self.id)}
  end 

  def shift_hash
    y = {}
    Shift.all.each {|x| 
      y[x] = nil 
    }
    y
  end 


end 