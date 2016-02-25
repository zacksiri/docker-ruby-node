# Ruby Node on Alpine

This will build the base image needed to run any rails app that uses

+ Postgres Database
+ Ruby 2.3.0
+ Node JS from Alpine Packages

## How to Use

Very simple simply do this in your rails app

### Create Dockerfile

Create a `Dockerfile` with the following content

```
FROM codemy/ruby-node
MAINTAINER Your Name <yourname@company.com>

# copy the source to the working dir
COPY . /usr/app

# bundle for production
RUN bundle install --path vendor/bundle --without development test --deployment && \
    apk del  build_deps

# clean up the apk cache
RUN rm -rf /var/cache/apk/*
```

### Build the docker image

Once you've added the docker file you can build the base image of your app using 