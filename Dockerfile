FROM ruby:2.5.3

RUN apt-get update -qq

RUN apt-get install -y \
      build-essential \
      chrpath \
      libfontconfig1 \
      libfontconfig1-dev \
      libfreetype6 \
      libfreetype6-dev \
      libpq-dev \
      libssl-dev \
      libxft-dev \
      nodejs \
      yarn

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN mkdir -p /var/www/
WORKDIR /var/www/

COPY . /var/www/

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler

RUN bundle install --jobs=4
