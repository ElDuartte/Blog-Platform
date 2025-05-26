FROM ruby:3.2.0

WORKDIR /app
COPY . .

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN gem install bundler -v 2.4.22
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
