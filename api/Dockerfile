FROM ruby:2.6.6

WORKDIR /usr/src/app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install -j4

COPY . .

ENTRYPOINT [ "bundle", "exec" ]
CMD [ "rails", "s", "-p", "3000", "-b", "0.0.0.0" ]
