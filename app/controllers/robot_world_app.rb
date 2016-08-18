class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    redirect '/robots'
  end

  get '/robots/dashboard' do
    @dashboard_data = {
      "average_age" => analyst.average_age,
      "year_hired_data_view" => analyst.year_hired_data_view,
      "department_data_view" => analyst.department_data_view,
      "city_data_view" => analyst.city_data_view,
      "state_data_view" => analyst.state_data_view,
    }
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  put '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_world.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do
    @robot = robot_world.find(params[:id].to_i)
    erb :edit
  end

  put '/robots/:id' do
    @robot = robot_world.update(params[:id].to_i, params[:robot])
    redirect "/robots/#{params[:id]}"
  end

  delete '/robots/:id' do
    robot_world.destroy(params[:id].to_i)
    redirect '/robots'
  end

  def robot_world
    database = ENV['RACK_ENV'] == "test" ? YAML::Store.new('db/robot_world_test') : YAML::Store.new('db/robot_world')
    @robot_world ||= RobotWorld.new(database)
  end

  def analyst
    RobotWorldAnalyst.new(robot_world)
  end
end
