FROM ruby:2.4.1-slim

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -qq -y\
  build-essential git-core libpq-dev --fix-missing --no-install-recommends libsqlite3-dev &&\
  apt-get -y clean

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
ENV APP_PATH /app
RUN mkdir -p $APP_PATH

WORKDIR $APP_PATH

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock .gemrc ./
RUN gem install bundler && bundle install --jobs `grep "^core id" /proc/cpuinfo | wc -l` --retry 3

# Copy the main application.
COPY . .

# Set UTF-8 as locale.
ENV LANG C.UTF-8

EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD bundle exec puma -C config/puma.rb