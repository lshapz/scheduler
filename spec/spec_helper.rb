ENV["PLAYLISTER_ENV"] = "test"

require_relative '../config/environment'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.order = 'default'

  config.before do
    reset_database
  end
end

def reset_database
  migrate_db
end

def clean_database
  Week.delete_all if defined?(Week) && DB.tables.include?("weeks")
  Shift.delete_all if defined?(Shift) && DB.tables.include?("shifts")
  Employee.delete_all if defined?(Employee) && DB.tables.include?("employees")
end
