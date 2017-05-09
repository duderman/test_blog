FROM ruby:2.3.1-alpine

RUN apk --update add postgresql-client tzdata nodejs && \
    apk --update add --virtual build-dependencies build-base ruby-dev=2.3.1-r0 \
    openssl-dev postgresql-dev libc-dev linux-headers libffi-dev git

ADD . /app

WORKDIR /app

ENV RAILS_ENV production

RUN gem install -N bundler && \
    bundle install --without development test && \
    bundle exec rails assets:precompile

RUN apk del build-dependencies && rm -rf /var/cache/apk/* /tmp/*

ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0", "-e", "production"]
