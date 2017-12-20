class Visit < ActiveRecord::Base
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :visit, optional: true
  belongs_to :user, optional: true
  Ahoy.track_visits_immediately = true
end
