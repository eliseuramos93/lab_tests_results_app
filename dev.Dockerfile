FROM ruby:3.3.0

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nodejs -y
RUN apt-get install npm -y
RUN npm install yarn -g
RUN apt-get update && apt-get install -y firefox-esr

WORKDIR /rails

COPY . /rails
RUN bundle install
