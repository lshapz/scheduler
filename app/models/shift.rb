class Shift < ActiveRecord::Base

  belongs_to :week
  belongs_to :employee 

  attr_accessor :weekday, :am_or_pm, :week, :employee
  
  def initialize(weekday: , am_or_pm: )
    @weekday = weekday 
    @am_or_pm = am_or_pm  
    @week = Self.week
  end 
  
  def symbolize
    day = weekday[0..1]
    time = am_or_pm[0]
    ":#{day}#{time}" 
  end 
  
  # def full?
  #   if self.find_by(id: self.id)
  # end 
  
    
end
