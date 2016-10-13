class Employee < ActiveRecord::Base

  has_many :shifts
  
  attr_reader :name, :id
  attr_accessor :cannot_work

  def initialize
    @name = name 
      insert into table employees name = self.name 
    @id = find_by(name).id 
  end 
  
  def get_nope
    @nope = gets.chomp
  end 
  
  def cannot_work(*nope)
    nah = nope.split(", ")
    #nah.each {|x| insert into employee_shifts_no_good (shift_id, employee_id) VALUES (x.id where x == shift.designation) (self.id)}
  end 


end 