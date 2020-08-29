FROM ruby:2.6.3

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get update -qq && apt-get install -y libgmp-dev nodejs postgresql-client
RUN mkdir /app

WORKDIR /app

COPY . /app

RUN bundle install
RUN npm i -g yarn && yarn

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]