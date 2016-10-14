require 'pry-byebug'
class EmployeeCLI

attr_accessor :populate, :me, :nope   

def self.populate
  Employee.populate
  Shift.populate
end 

def who_am_I
  puts "What is your name?"
    input = gets.chomp
  @me = Employee.find_by(name: input)
end 

def get_nope
  puts "when can't you work? input as follows: mon1, fri2, sun1, sun2"
  @nope = gets.chomp
end 

def runner 
  #@me = who_am_I
  #@nope = get_nope
  #EmployeeCLI.populate
  @me = who_am_I
  puts "Do you want to submit availability (1) or see the complete schedule (2)?"
  input = gets.chomp
    case input
      when "1" || 1 
        me.cannot_work(get_nope) 
          puts "thanks"
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
            puts "#{k[0].upcase}#{k[1..-2]} AM: #{v[0].upcase}#{v[1..-1]}"
          elsif k.last == "2"
            puts "#{k[0].upcase}#{k[1..-2]} PM: #{v[0].upcase}#{v[1..-1]}"
          else
            puts "that is not a real shift"
        end 
    end
end 

end 

