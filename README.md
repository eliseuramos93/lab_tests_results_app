# Lab Tests Results Application

This application is a refactoring of the [RebaseLabs](https://github.com/eliseuramos93/rebase-labs) project I did a few weeks ago. The application consists of a SPA aimed at displaying medical test results based on querying the information contained in the database.

The original application was made using the [Sinatra](https://sinatrarb.com) framework, and this version will be made with Rails 7.1.3.2. Some parts of the challenge will remain the same as the initial proposal:

- Use Docker containers for each part of the application (database, backend, frontend, asynchronous task processing, in-memory database for asynchronous processing, etc.);
- Divide the application into backend and frontend, using HTTP communication between them for their operation;
- Import data from a CSV document and feed the database with this information through a Ruby script;
- Display on the frontend the data originating from the database query, instead of presenting the data directly from the CSV file;
- User must be able to upload a .csv file that, if it meets the document validation requirements, should be processed asynchronously by the server;
- User must be able to search for a test by its token and view the details of their test, such as test types, limits, and results;

And for study purposes, I will add some extra challenges myself:

- Use Turbo to emulate a responsive SPA behavior;
- Use NGINX for the first time in my studies, so that the application only accepts HTTPS requests;
- Apply styling using Bootstrap to create a more pleasant visual for the application;
- Hide all sensitive information (e.g., database passwords, Rails master key) in .env files to avoid uploading them to GitHub;
- Optimize database normalization for maximum efficiency;
- Perform my first deployment using this application, to better understand the functioning of platforms like AWS and/or Heroku.

## About the application language

Everything related to the code and the project will be in English, including commit messages, occasional comments, test descriptions, etc. However, the content of the application itself will be available in Portuguese (specifically, pt-BR) through the use of I18n.

## Prerequisites to run the application

Have Docker Engine (or Docker Desktop) installed on your local machine. The instructions in this README will use a Unix environment (specifically, Ubuntu) for the commands. If you are using another operating system (macOS or Windows), some adaptations and/or the use of some software to emulate a Linux environment (e.g., WSL) may be necessary.

## How to run the application in a development environment

WIP

## How to run the application tests

WIP
