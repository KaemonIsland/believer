# frozen_string_literal: true

require 'csv'

# Creates a rake task load
namespace :load do
  # task to load all sightings data from csv file
  # Run with `rails load:csv`
  task csv: :environment do
    puts 'Loading File...'
    # Path to CSV file
    filepath = Rails.root.join('./ufo_sightings.csv')

    # Grabs CSV contents
    csv_text = File.read(filepath)

    # Parses csv_text for us to more easily work with
    csv = CSV.parse(csv_text, headers: true)

    puts 'Adding file data to Sightings, this may take awhile'
    load_start = Time.now

    csv.each do |sighting_raw|
      # Contains data used for sighting creation
      sighting = {}

      # Converts sighting to hash
      sighting_data = sighting_raw.to_hash

      # Carry over unmodified values
      sighting[:shape] = sighting_data['shape']
      sighting[:comments] = sighting_data['comments']

      # Create formatted Date with strptime
      # @see https://ruby-doc.org/stdlib-2.7.2/libdoc/date/rdoc/DateTime.html#method-c-strptime
      begin
        sighting[:sighting_date] = Date.strptime(
          sighting_data['Sighting date/time'],
          '%d/%m/%Y %H:%M'
        )
      rescue StandardError
        sighting[:sighting_date] = nil
      end

      # Format duration (seconds) to minutes
      sighting[:duration] = sighting_data['duration (seconds)'].to_i / 60

      # Comes in the form of "san marcos tx (29.8830556:-97.9411111)"
      # We'll split this up by ' ' in order to grap individual values
      # Last item is lattitude/longitude
      # Second to last is State
      # City is everything before state
      location = sighting_data['Site Location Lat/Lng'].split(' ')

      # This should be added to the model
      sighting[:city] = location[0...-2].join(' ').titlecase

      # This should be within the model
      sighting[:state] = location[-2].upcase

      # Comes in the form of (29.8830556:-97.9411111)"
      # Here we remove '()' and split by ':' giving us the individual values
      lat_lng = location[-1].delete!('()').split(':')

      sighting[:latitude] = lat_lng[0].to_f
      sighting[:longitude] = lat_lng[1].to_f

      Sighting.create!(sighting)
    end

    load_end = Time.now
    puts 'Upload Finished!'
    puts "The upload took #{((load_end - load_start) / 60).round(2)} minutes."
  end
end
