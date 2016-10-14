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
  
      y.each do |x| 
        x.each do |k, v| 
          if k == "designation" || k == "name" 
            puts x[k]
          end
        end
      end
end 

def runner 
  #@me = who_am_I
  #@nope = get_nope
  unavails 
  puts "oy gevalt"
end

def completed
  sql = <<-SQL 
  select shifts.designation, employees.name 
    from employee_shifts_assigned join employees
    on employee_shifts_assigned.employee_id = employees.id 
    join shifts on employee_shifts_assigned.shift_id = shifts.id;
    SQL

  raw = DB.execute(sql)
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
            puts "#{k[0].upcase}#{k[1..-2]} AM: #{v[0].upcase}#{v[1..-1]}"
          elsif k.last == "2"
            puts "#{k[0].upcase}#{k[1..-2]} PM: #{v[0].upcase}#{v[1..-1]}"
          else
            puts "that is not a real shift"
        end 
    end


end 


end 

