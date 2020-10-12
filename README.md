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

# DB Schema

The database schema for Hotspots and Sightings is very straight-forward.

## Hotspots

| table     | type    | required? |
| --------- | ------- | --------- |
| name      | string  | yes       |
| latitude  | decimal | yes       |
| longitude | decimal | yes       |

## Sightings

| table         | type     | required? |
| ------------- | -------- | --------- |
| sighting_date | datetime | no        |
| shape         | string   | no        |
| duration      | integer  | yes       |
| comments      | text     | no        |
| city          | string   | no        |
| state         | string   | no        |
| latitude      | decimal  | yes       |
| longitude     | decimal  | yes       |

# My Challenges

## testing

I decided to use Minitest since it comes built-in with a new rails project. It's been a while since I've used unit testing in rails. (I'm used to Cypress integration testing in JS/React)

If I had more time, or if this would have been a larger project that I spent more time on I would have done things very differently. Testing is amazing and should be on everything but it also takes time to create and I didn't want to spend the entire challenge testing haha.

I would have changed Minitest to Rspec. I'm more familiar with it + we use it at my current job.
Add Factory-girl + db_cleaner to easily create model instances and ensure the db is cleaned after each test.
Maybe even add Faker to generate more + better seeding data

I did have a challenging deciding whether I should supply default values for sightings or just allow them to be blank. As you can see from the code I decided to remove some of the validations just for ease, and because the values weren't required with the other challenge requirements. I shouldn't have over-engineered my tests for models.

## Command Line Tasks

This was the first time I had created a command line task. It was surprisingly easy to do which was nice! It took me a while to find a good distance formula to use. I think I finally found one I liked, but Im not sure if the distance is accurate or not. I think I have messed something up with converting to miles. But not sure on that.
