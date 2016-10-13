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
  
  # def symbolize
  #   day = weekday[0..1]
  #   time = am_or_pm[0]
  #   ":#{day}#{time}" 
  # end 
  
  # def full?
  #   if self.find_by(id: self.id)
  # end 
  
    
end
