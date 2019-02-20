class Trail < ApplicationRecord
  has_many :trip_tails
  has_many :trips, through: :trip_tails

  def total_trips
    trips.count
  end


end
