FROM ruby:2.5

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

RUN apt-get update
RUN apt-get install -y curl software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get -y install nodejs

COPY . .

RUN bundle exec rails db:setup
RUN bundle exec rails db:reset

RUN bundle exec rails

CMD ["rails", "server", "-b", "0.0.0.0"]