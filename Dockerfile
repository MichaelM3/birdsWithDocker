FROM ruby:latest

RUN apt-get update -qq && apt-get install -y nodejs yarn
WORKDIR /birds
COPY Gemfile /birds/Gemfile
COPY Gemfile.lock /birds/Gemfile.lock
RUN bundle install


COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]