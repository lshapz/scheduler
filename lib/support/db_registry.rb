require 'ostruct'
DBRegistry ||= OpenStruct.new( 
  development: ConnectionAdapter.new("db/scheduler-development.db")
    )
