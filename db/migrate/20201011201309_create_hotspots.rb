# frozen_string_literal: true

class CreateHotspots < ActiveRecord::Migration[6.0]
  def change
    create_table :hotspots do |t|
      t.string :name
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :latitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
