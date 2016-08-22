ENV["RACK_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "minitest/pride"
require "capybara/dsl"

module TestHelpers

  def make_ten_robots
    data_for_ten_robots.each { |data| robot_world.create(data) }
  end

  def teardown
    robot_world.delete_all
    super
  end

  def robot_world
    database = SQLite3::Database.new("db/robot_world_test.db")
    database.results_as_hash = true
    RobotWorld.new(database)
  end

  def data_for_ten_robots
    [{:name => "T1000", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T102", :city => "Boulder", :state => "Colorado",
      :birthdate => "2004-08-16", :date_hired => "2006-08-17",
      :department => "a bad department"},
      {:name => "T103", :city => "Boulder", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T104", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T105", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T106", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T107", :city => "Denver", :state => "Colorado",
      :birthdate => "1983-08-16", :date_hired => "1990-08-17",
      :department => "a great department"},
      {:name => "T108", :city => "Denver", :state => "Colorado",
      :birthdate => "1983-08-16", :date_hired => "1990-08-17",
      :department => "a great department"},
      {:name => "T109", :city => "Denver", :state => "Colorado",
      :birthdate => "2000-08-16", :date_hired => "2001-08-17",
      :department => "a great department"},
      {:name => "T110", :city => "Denver", :state => "Colorado",
      :birthdate => "2000-08-16", :date_hired => "2001-08-17",
      :department => "a great department"}]
  end

end


Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
