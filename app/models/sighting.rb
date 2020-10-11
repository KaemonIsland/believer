# frozen_string_literal: true

class Sighting < ApplicationRecord
  after_initialize :init

  validates :sighting_date, presence: true
  validates :shape, presence: true
  validates :duration, presence: true
  validates :comments, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  # Sets default value for missing data
  def init
    self.datetime ||= 'N/A'
    self.string ||= 'N/A'
    self.integer ||= 'N/A'
    self.text ||= 'N/A'
    self.string ||= 'N/A'
    self.string ||= 'N/A'
    self.decimal ||= 'N/A'
    self.decimal ||= 'N/A'
  end
end
