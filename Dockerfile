FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
RUN rails generate simple_form:install
RUN rails generate devise:install
RUN rails generate devise MODEL
RUN guard init livereload
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

#CMD ["rails", "generate", "devise:install"]
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]