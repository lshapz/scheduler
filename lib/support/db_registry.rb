require 'ostruct'
DBRegistry ||= OpenStruct.new(test: ConnectionAdapter.new("db/scheduler-test.db"), 
  development: ConnectionAdapter.new("db/scheduler-development.db"), 
  production: ConnectionAdapter.new("db/scheduler-production.db")
  )
