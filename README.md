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

| column    | type    | required? |
| --------- | ------- | --------- |
| name      | string  | yes       |
| latitude  | decimal | yes       |
| longitude | decimal | yes       |

## Sightings

| column        | type     | required? |
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

# Assumptions

I had assumed that all the values for each model should be required. This really hurt my time once I realized that several values were missing within the CSV file, so deciding how to change my tests/model file really slowed me down.

I also figured that the first 3 steps would be the hardest, only because I havent worked with tasks and reading/writing files before. I was right that it took me longer than I had planned. But I'm also glad that I could complete them.

# Next Steps

There is a lot that can be done to complete this challenge! First off I would say that breaking up the large tasks would be first on my plate. They could be broken down into smaller functions during refactoring to make things a lot easier to work with in the future.

I don't like the function used within the JSON file task. A loop within a loop is really slow, but because of time constraints I just went for the brute force approach. This algorithm goes through every sighting for each hotspot. This would be a lot better if we would first remove sightings for hotspots that are within range. Thus making the pool of sightings smaller each time.

I also think that the method for locating sightings within 750 miles would be better off within a hotspot model.

## Challenge steps

Next thing would just be to create CRUD actions with a Sighting controller. Probably just use `rails g controller Sighting` then add the methods along with add a POST route for uploading sightings.

To create the web-app we just need to add a view and some form elements to Add/Update/Remove additional sightings.
