FROM ruby:2.3.0-alpine
MAINTAINER Zack Siri <zack@codemy.net>

RUN apk update
RUN apk upgrade
# we install the basic packages
# libpq is used for building the pg gem
RUN apk add curl wget bash git libpq nodejs tzdata

# install bundler so we use the latest
# in preparation for the rest
RUN gem install bundler --no-document

RUN apk --update add --virtual build_deps \
    build-base libc-dev linux-headers \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev && \
    bundle config build.nokogiri --use-system-libraries

RUN mkdir /usr/app
WORKDIR /usr/app