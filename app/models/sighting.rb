# frozen_string_literal: true

class Sighting < ApplicationRecord
  validates :sighting_date, presence: true
  validates :shape, presence: true
  validates :duration, presence: true
  validates :comments, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
