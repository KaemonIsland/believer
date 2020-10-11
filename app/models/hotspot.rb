# frozen_string_literal: true

class Hotspot < ApplicationRecord
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
