class Game < ActiveRecord::Base
  validates :team_id, presence: true
  validates :opponent, presence: true
  validates :time, presence: true

  def team
    Team.find(team_id)
  end
  def specification(group_id,user_id)
    Specification.where(:game_id=>self.id).where(:group_id=>group_id).where(:user_id=>user_id).first
  end
  def weather
     require 'open-uri'
     require 'json'
     @address = self.team.home_location
        # Your code goes here.
        url ="http://maps.googleapis.com/maps/api/geocode/json?address="+URI.encode(@address)
        raw_data =open(url).read
        parsed_data = JSON.parse(raw_data)
        @latitude =parsed_data["results"][0]["geometry"]["location"]["lat"]
        @longitude =parsed_data["results"][0]["geometry"]["location"]["lng"]

    your_api_key = "6f5d228f02e4a5377213ca390dc7f792"

      new_url ="https://api.forecast.io/forecast/#{your_api_key}/#{@latitude},#{@longitude},#{self.time.to_i}"
      new_raw_data = open(new_url).read
      new_parsed_data = JSON.parse(new_raw_data)
      @temperature = new_parsed_data["currently"]["temperature"]
      @summary=new_parsed_data["currently"]["summary"]
      @results_hash=Hash.new
      @results_hash[:temperature]=@temperature
      @results_hash[:summary]=@summary
      return @results_hash
    end
end
