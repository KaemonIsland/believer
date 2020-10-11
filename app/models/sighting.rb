# frozen_string_literal: true

class Sighting < ApplicationRecord
  validates :duration, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
