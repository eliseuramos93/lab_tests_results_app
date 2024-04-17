FROM ruby:3.3.0

RUN apt-get update -qq
RUN apt-get install nodejs -y
RUN apt-get install npm -y
RUN npm install yarn -g

WORKDIR /rails

COPY . /rails
RUN bundle install
