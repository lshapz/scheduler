require 'pry'
require 'bundler/setup'
Bundler.require

require 'active_record'
require 'rake'
 # set :database, {adapter: "sqlite3", database: "foo.sqlite3"}
  


ENV["SCHEDULER"] ||= "development"

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/clis", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}
#binding.pry
DBRegistry[ENV["SCHEDULER"]].connect! 
DB = ActiveRecord::Base.connection

if ENV["SCHEDULER"] == "test"
  ActiveRecord::Migration.verbose = false
end

def migrate_db
  DB.tables.each do |table|
    DB.execute("DROP TABLE #{table}")
  end

  Dir[File.join(File.dirname(__FILE__), "../db/migrate", "*.rb")].each do |f| 
    require f
    migration = Kernel.const_get(f.split("/").last.split(".rb").first.gsub(/\d+/, "").split("_").collect{|w| w.strip.capitalize}.join())
    migration.migrate(:up)
  end
end

def drop_db
  DB.data_sources.each do |table|
    DB.execute("DROP TABLE #{table}")
  end

end
