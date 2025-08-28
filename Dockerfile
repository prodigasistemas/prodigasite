FROM ruby:2.7.4

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without test

COPY . .

ARG RAILS_ENV
ENV RAILS_ENV=${RAILS_ENV}

RUN    SECRET_KEY_BASE=$(bundle exec rake secret) ${RAILS_ENV} bundle exec rake assets:precompile \
    && groupadd -r rails \
    && useradd -r -g rails rails \
    && chown -R rails:rails /app

USER rails

EXPOSE 3000 4000

CMD ["sh", "-c", "SECRET_KEY_BASE=$(bundle exec rake secret) bundle exec puma -C config/puma.rb"]
