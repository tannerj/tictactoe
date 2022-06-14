# syntax=docker/dockerfile:1

FROM ruby:3.1.2-bullseye

WORKDIR /usr/src/app

COPY lib/tic_tac_toe/version.rb lib/tic_tac_toe/
COPY tic_tac_toe.gemspec .
COPY Gemfile* .
RUN bundle install

COPY . .

CMD ["Bash"]
