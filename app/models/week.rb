class Week < ActiveRecord::Base

  has_many :employees
  has_many :shifts


def display
  DB.execute("select shift.designation, employee.name from employee_shifts_assigned join shifts on employee_shifts_assigned.shift_id = shifts.id join employees on employee_shifts_assigned.employee_id = employee.id")
end 

end
