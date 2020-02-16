FROM ruby:2.6.5

WORKDIR /usr/src/app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install -j4

COPY . .

ENTRYPOINT [ "bundle", "exec" ]
CMD [ "rails", "s", "-p", "3000" ]
