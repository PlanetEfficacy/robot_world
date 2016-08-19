require 'sqlite3'

environments = ["test", "development"]

environments.each do |environment|
  database = SQLite3::Database.new("db/robot_world_#{environment}.db")
  database.execute("CREATE TABLE robots (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR(100),
          city VARCHAR(100),
          state VARCHAR(12),
          department VARCHAR(100),
          birthdate DATE,
          date_hired DATE,
          avatar_sm VARCHAR(2083),
          avatar_md VARCHAR(2083),
          avatar_lg VARCHAR(2083)
        );"
  )
  puts "creating tasks table for #{environment}"
end
