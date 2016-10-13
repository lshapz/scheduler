class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name 
    end
  end
end


# CREATE TABLE `employees` (
#   `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
#   `name`  TEXT
# );