# frozen_string_literal: true

require 'test_helper'

class HotspotTest < ActiveSupport::TestCase
  test 'fails without name' do
    hotspot = Hotspot.new(longitude: 1.2345, latitude: 5.678)
    refute hotspot.save
  end

  test 'fails without longitude' do
    hotspot = Hotspot.new(name: 'test', latitude: 5.678)
    refute hotspot.save
  end

  test 'fails without latitude' do
    hotspot = Hotspot.new(name: 'test', longitude: 1.2345)
    refute hotspot.save
  end
end
