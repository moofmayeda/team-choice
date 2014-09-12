class Pin < ActiveRecord::Base
  has_and_belongs_to_many :users
  before_create :coordinates
  validates :address, presence: true
  validates :name, presence: true

  def geocodify
    self.address.gsub!(' ', '+')
  end


  def coordinates
    begin
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://maps.googleapis.com/maps/api/geocode/json?address=#{self.geocodify}&key=#{ENV['API_KEY']}"
      ).execute

      jdata = JSON.parse(response)
      self.lat = jdata['results'].first["geometry"]["location"]["lat"]
      self.lon = jdata['results'].first["geometry"]["location"]["lng"]
    rescue
      false
    end
  end


end
