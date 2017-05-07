# Volunteer Tracker
### By Dan Jacob 5/5/17

  Epicodus Project Week 3 || Database practice to keep keep track of volunteers and projects

## Description
This application serves as practice in Ruby and SQL Database Relationships by building an internal website to track volunteers that are working on projects. Each project can have many volunteers, but a volunteer can only work on one project at a time. Users will able to view all projects and volunteers, as well as edit volunteers and projects.

## Prerequisites

###### To run this application, you must have postgres, Ruby, Sinatra, and the specific gems required listed in the Gemfile installed on your local device

## Installing

##### Before beginning the clone/download process it is imperative to create a local Database using PSQL
* In one tab of your terminal window type postgres
* Open another tab in your terminal (Alt + T) and run psql
* In the psql tab run follow the procedure below

```
CREATE DATABASE volunteer_tracker;
\c volunteer_tracker
CREATE TABLE volunteers (id serial primary key, first_name varchar, last_name varchar, project_id int);
CREATE TABLE projects (id serial primary key, name varchar);
CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

```

*In the terminal, open a new tab and change into the desktop, and clone this repository, after cloning/download is complete run bundle to download all gems, and finally run ruby app.rb to view the application on a browser*

```
cd desktop
git clone https://github.com/DanJacobCodes/volunteer_tracker.git
bundle
ruby app.rb
```

*After these steps are complete you can view the application by navigating to your preferred browser and typing (or pasting) in the URL bar the "link" listed below*
```
localhost:4567
```
## Support and contact details

If any issues occur contact me at dansamueljacob@gmail.com

## Technologies Used
 HTML, CSS, Bootstrap, Ruby, Sinatra, Capybara, Postgres, PSQL

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
