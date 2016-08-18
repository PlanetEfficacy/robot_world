require 'yaml/store'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database['robots'] ||= []
      id = generate_id(database['robots'])
      database['robots'] << {
        "id" => id,
        "name" => robot[:name],
        "city" => robot[:city],
        "state" => robot[:state],
        "avatar_sm" => generate_avatar(200, id),
        "avatar_md" => generate_avatar(500, id),
        "avatar_lg" => generate_avatar(800, id),
        "date_hired" => robot[:date_hired],
        "birthdate" => robot[:birthdate],
        "department" => robot[:department]}
    end
  end

  def generate_id(robots)
    robots.length == 0 ? 1001 : robots[robots.length - 1]["id"] + 1
  end

  def generate_avatar(dimmension, id)
    dimmensions = dimmension.to_s + "x" + dimmension.to_s
    "https://robohash.org/" + id.to_s + "/?set=set3&size=" + dimmensions
  end

  def raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot_data)
    database.transaction do
      robot = database["robots"].find { |data| data["id"] == id }
      robot["name"]       = robot_data[:name]
      robot["city"]       = robot_data[:city]
      robot["state"]      = robot_data[:state]
      robot["department"] = robot_data[:department]
      robot["birthdate"]  = robot_data[:birthdate]
      robot["date_hired"] = robot_data[:date_hired]
    end
  end

  def destroy(id)
    database.transaction do
      database["robots"].delete_if { |robot| robot["id"] == id }
    end
  end


  def delete_all
    database.transaction do
      database['robots'] = []
    end
  end

end
