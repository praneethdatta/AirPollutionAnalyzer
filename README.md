# README

# Air Pollution Analyzer

## Introduction

Air Pollution Analyzer is a web application that provides information about air quality in different Indian cities. It fetches air pollution data from OpenWeatherMap API and allows users to view and analyze air quality information.

## Getting Started

These instructions will help you set up the project on your local machine.

### Prerequisites

Make sure you have the following installed:

- Ruby (version 3.1.2)
- Ruby on Rails (version 7.1.2)
- PostgreSQL

### Installation

1. Clone the repository:

   ```
   git clone https://github.com/praneethdatta/AirPollutionAnalyzer.git
   ```

2. Change to the project directory:

   ```
   cd air-pollution-analyzer
   ```

3. Install dependencies:

   ```
   bundle install
   ```

4. Set up the database:

   ```
   rails db:create
   rails db:migrate
   ```

5. Set up environment variables:

     Create a .env file in the project root and add the following:
   ```
    OPENWEATHERMAP_API_KEY=your_openweathermap_api_key
   ```
     Replace your_openweathermap_api_key with your actual OpenWeatherMap API key.



6. Add Location information:

   ```
   rails fetch_locations:execute
   ```
      This will add records in the _Location_ table
   


8. Populate the AirPollutionData 

   ```
    bundle exec sidekiq 
   ```
      Start the _sidekiq_ server. This will create/update the _AirPollutionData_ data periodically. Make sure redis is running in the background


