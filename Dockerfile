FROM ruby:3.1.3

RUN apt-get update && \
  apt-get install --reinstall -y locales && \
  sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US
ENV LC_ALL en_US.UTF-8

RUN mkdir -p /app

WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app

RUN gem --version
RUN gem install bundler:2.2.13
RUN bundle install

EXPOSE 4000