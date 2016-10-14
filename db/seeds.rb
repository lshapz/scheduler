require_relative '../config/environment'


sql = <<-SQL
insert into employee_shifts_assigned (shift_id, employee_id)
  VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 1),
  (6, 4),
  (7, 3),
  (8, 4),
  (9, 3),
  (10, 4),
  (11, 1),
  (12, 2),
  (13, 1),
  (14, 2);

SQL

DB.execute(sql)