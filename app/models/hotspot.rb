# frozen_string_literal: true

class Hotspot < ApplicationRecord
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  def toRad(num)
    num * Math::PI / 180
  end

  # Calculates distance, in miles, from hotspot
  # @see https://stackoverflow.com/questions/18883601/function-to-calculate-distance-between-two-coordinates
  def distance(lat, lon)
    radius = 6371

    lat1 = latitude
    lon1 = longitude

    lat2 = lat
    lon2 = lon

    dLat = toRad(lat2 - lat1)
    dLon = toRad(lon2 - lon1)

    a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    # Returns distance in miles
    (radius * c) / 1.60934
  end
end
