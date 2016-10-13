class CreateEmployeeShiftsNoGood < ActiveRecord::Migration
  def change
    create_table :employee_shifts_no_good do |t|
      t.integer :employee_id
      t.integer :shift_id 
    end
  end
end




# CREATE TABLE "employee_shifts_no_good" (
#   `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
#   `employee_id` INTEGER,
#   `shift_id`  INTEGER
# );