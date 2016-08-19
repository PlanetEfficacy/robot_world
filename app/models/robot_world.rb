require 'yaml/store'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (name, city, state, avatar_sm,
      avatar_md, avatar_lg, date_hired, birthdate, department)
      VALUES ('#{robot[:name]}',
              '#{robot[:city]}',
              '#{robot[:state]}',
              '#{generate_avatar(200, robot[:name])}',
              '#{generate_avatar(500, robot[:name])}',
              '#{generate_avatar(800, robot[:name])}',
              '#{robot[:date_hired]}',
              '#{robot[:birthdate]}',
              '#{robot[:department]}');"
    )
  end

  def generate_avatar(dimmension, id)
    dimmensions = dimmension.to_s + "x" + dimmension.to_s
    "https://robohash.org/" + id.to_s + "/?set=set3&size=" + dimmensions
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(id)
    database.execute("SELECT * FROM robots WHERE id=?;", id).first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot_data)
    database.execute("UPDATE robots
      SET name=:name, city=:city, state=:state, department=:department,
        birthdate=:birthdate, date_hired=:date_hired
      WHERE id=:id",
        :id         => id,
        :name       => robot_data[:name],
        :city       => robot_data[:city],
        :state      => robot_data[:state],
        :department => robot_data[:department],
        :birthdate  => robot_data[:birthdate],
        :date_hired => robot_data[:date_hired]
    )
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id=:id", :id => id)
  end


  def delete_all
    database.execute("DELETE FROM robots")
  end

end
