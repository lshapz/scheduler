class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :designation
    end
  end
end


# CREATE TABLE `shifts` (
#   `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
#   `designation` INTEGER
# );