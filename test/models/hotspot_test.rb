# frozen_string_literal: true

require 'test_helper'

class HotspotTest < ActiveSupport::TestCase
  setup do
    @hotspot = Hotspot.new(
      name: 'test',
      longitude: 1.234,
      latitude: 5.678
    )
  end

  test 'succeeds with valid values' do
    assert @hotspot.save
  end

  test 'fails without name' do
    @hotspot.name = nil
    refute @hotspot.save
  end

  test 'fails without longitude' do
    @hotspot.longitude = nil
    refute @hotspot.save
  end

  test 'fails without latitude' do
    @hotspot.latitude = nil
    refute @hotspot.save
  end
end
