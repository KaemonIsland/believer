# frozen_string_literal: true

require 'test_helper'

class SightingTest < ActiveSupport::TestCase
  setup do
    @sighting = Sighting.new(
      sighting_date: Date.new,
      shape: 'oval',
      duration: 5,
      comments: 'It just hovered there.... MENACINGLY!',
      city: 'South Jordan',
      state: 'Utah',
      longitude: 1.2345,
      latitude: 5.678
    )
  end

  test 'succeeds with all values present' do
    assert @sighting.save
  end

  test 'fails without date' do
    @sighting.sighting_date = nil
    refute @sighting.save
  end

  test 'fails without shape' do
    @sighting.shape = nil
    refute @sighting.save
  end

  test 'fails without duration' do
    @sighting.duration = nil
    refute @sighting.save
  end

  test 'fails without comments' do
    @sighting.comments = nil
    refute @sighting.save
  end

  test 'fails without city' do
    @sighting.city = nil
    refute @sighting.save
  end

  test 'fails without state' do
    @sighting.state = nil
    refute @sighting.save
  end

  test 'fails without longitude' do
    @sighting.longitude = nil
    refute @sighting.save
  end

  test 'fails without latitude' do
    @sighting.latitude = nil
    refute @sighting.save
  end
end
