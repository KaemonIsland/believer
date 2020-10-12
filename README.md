# believer

Tracker for UFO Sightings and Hotspots

# Setting up

This project assumes you already have a rails environment for your machine. Otherwise checkout [Ruby on Rails Guides](https://guides.rubyonrails.org/getting_started.html) to get started!

## Clone this repository

Within your command line run `git clone https://github.com/KaemonIsland/believer.git` to clone the repository

## Setup the DB

Next, cd into the project, `cd ./believer`, and run:

`rails db:create`: Creates the required DB

`rails db:migrate`: Runs all migrations

`rails db:seed`: Creates 5 Hotspots

You should be good to go!

# Tasks

Currently this project can perform 2 tasks.

## Load CSV File

`rails load:csv`

Load a CSV file full of UFO sightings to the DB.

## Sightings near Hotspots

`rails hotspot:json`

Creates a JSON file containing all sightings within a 750 mile radius of each Hotspot.

# Tests

`rails test`

Runs unit tests for Hotspot and Sighting models.

currently contains model validation tests.
