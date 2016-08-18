class Robot
  attr_reader :id,
  :name,
  :city,
  :state,
  :avatar_sm,
  :avatar_md,
  :avatar_lg,
  :birthdate,
  :date_hired,
  :department

  def initialize(data)
    @id         = data["id"].to_i
    @name       = data["name"]
    @city       = data["city"]
    @state      = data["state"]
    @avatar_sm  = data["avatar_sm"]
    @avatar_md  = data["avatar_md"]
    @avatar_lg  = data["avatar_lg"]
    @birthdate  = data["birthdate"].class == Date ? data["birthdate"] : Date.parse(data["birthdate"])
    @date_hired = data["date_hired"].class == Date ? data["date_hired"] : Date.parse(data["date_hired"])
    @department = data["department"]
  end

  def age
    (Date.today - birthdate).to_i/365
  end

  def year_hired
    date_hired.year
  end

end
