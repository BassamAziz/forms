# Forms
A customizable form manager

## What does it do

 - allows managing custom attributes for users, profiles, event registration
 - allows saving custom data for users, profiles, event registrations
 - allows editing a custom attribute to be required or optional
 - data types supported for custom attributes: `text`, `boolean`
 
## Example Use cases

  - Admin manages the global User custom attributes.
  - Admin manages a specific Event’s custom attributes.
  - Admin makes a custom attribute optional/required on the User profile
  - Admin makes a custom attribute optional/required on the User signup form
  - Admin makes a custom attribute optional/required on a specific Event Registration form
  - User fills in a custom attribute on his profile
  - User fills in a custom attribute on the signup form
  - User fills in a custom attribute on an Event Registration form
  - User reads his custom attributes on his profile
  - Admin reads an Event registration’s custom attributes
        
## How to use it
  Check the specs, there you will find use cases for:
   - creating valid data
   - creaeting custom attributes
   - filling in custom data
   - fetching custom data

## Run it

  1. Build all the necessary containers by running: `docker-compose build`
  2. Setup the database by running: `docker-compose run web rake db:create db:setup`
  3. To run the console: `docker-compose run web rails console`
  4. To run the specs: `docker-compose run web rake`
