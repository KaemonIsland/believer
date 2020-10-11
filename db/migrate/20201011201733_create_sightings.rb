# frozen_string_literal: true

class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.datetime :sighting_date
      t.string :shape
      t.integer :duration
      t.text :comments
      t.string :city
      t.string :state
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :latitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
