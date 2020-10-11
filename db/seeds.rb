# frozen_string_literal: true

# Creates 5 example hotspots from challenge
Hotspot.create([
                 {
                   name: 'The White House',
                   latitude: 38.897663,
                   longitude: -77.036575
                 },
                 {
                   name: 'World’s Tallest Thermometer',
                   latitude: 35.26644,
                   longitude: -116.07275
                 },
                 {
                   name: 'Area 51',
                   latitude: 37.233333,
                   longitude: -115.808333
                 },
                 {
                   name: 'Disney World’s Magic Kingdom',
                   latitude: 28.404010,
                   longitude: -81.576900
                 },
                 {
                   name: 'Pop\'s Soda Bottle',
                   latitude: 35.658340,
                   longitude: -97.335490
                 }
               ])
