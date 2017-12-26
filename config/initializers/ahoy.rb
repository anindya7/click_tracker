class Ahoy::Store < Ahoy::Stores::ActiveRecordStore  
  Ahoy.quiet = false
  Ahoy.track_visits_immediately = true
  Ahoy.geocode = :async

  def exclude?
    user ? false : bot?
  end
end 
