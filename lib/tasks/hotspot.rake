# frozen_string_literal: true

namespace :hotspot do
  task json: :environment do
    output = {}
    Hotspot.all.each do |hotspot|
      nearby_sighting = []
      Sighting.all[0..50].each do |sighting|
        # Calculates distance in miles
        # @see https://stackoverflow.com/questions/481144/equation-for-testing-if-a-point-is-inside-a-circle
        distance = ((sighting.latitude - hotspot.latitude)**2 + (sighting.longitude - hotspot.longitude)**2) * 69
        nearby_sighting << sighting if distance <= 750**2
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
