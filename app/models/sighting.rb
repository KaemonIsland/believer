# frozen_string_literal: true

class Sighting < ApplicationRecord
  after_initialize :init

  validates :sighting_date, presence: true, allow_nil: true
  validates :shape, presence: true
  validates :duration, presence: true, allow_nil: true
  validates :comments, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :longitude, presence: true, allow_nil: true
  validates :latitude, presence: true, allow_nil: true

  # Sets default value for missing data
  def init
    self.sighting_date ||= nil
    self.shape ||= 'N/A'
    self.duration ||= nil
    self.comments ||= 'N/A'
    self.city ||= 'N/A'
    self.state ||= 'N/A'
    self.longitude ||= nil
    self.latitude ||= nil
  end
end
