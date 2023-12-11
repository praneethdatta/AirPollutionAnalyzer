# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Air Pollution Analyzer

## Introduction

Air Pollution Analyzer is a web application that provides information about air quality at different locations. It fetches air pollution data from OpenWeatherMap API and allows users to view and analyze air quality information.

## Getting Started

These instructions will help you set up the project on your local machine.

### Prerequisites

Make sure you have the following installed:

- Ruby (version 3.1.2)
- Ruby on Rails (version 7.1.2)
- PostgreSQL

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/air-pollution-analyzer.git

2. Change to the project directory:

  ```bash
   cd air-pollution-analyzer

3. Install dependencies:

  ```bash
   bundle install

4. Set up the database:

  ```bash
   rails db:create
   rails db:migrate

5. Set up environment variables:

  Create a .env file in the project root and add the following:
  ```bash
    OPENWEATHERMAP_API_KEY=your_openweathermap_api_key
  Replace your_openweathermap_api_key with your actual OpenWeatherMap API key.

6. Update geocoding information:

  ```bash
   rails geocode:update_all
