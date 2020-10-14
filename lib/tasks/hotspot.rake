# frozen_string_literal: true

namespace :hotspot do
  task json: :environment do
    output = {}
    Hotspot.all.each do |hotspot|
      nearby_sighting = []
      Sighting.all[0..50].each do |sight|
        # Adds sighting to hotspot if within radius
        if hotspot.distance(sight.latitude, sight.longitude) <= 750
          nearby_sighting << sight
        end
      end
      output[hotspot.name.to_sym] = nearby_sighting
    end
    # Creates new json file
    output_file = File.new('hotspots.json', 'w')

    # Adds output data
    output_file.puts(output.to_json)

    output_file.close
  end
end
