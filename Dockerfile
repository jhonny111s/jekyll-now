# https://hub.docker.com/_/ubuntu
FROM ubuntu
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Jekyll's and Ubuntu's system requirements - https://jekyllrb.com/docs/installation/#requirements
RUN apt-get update && apt-get -y install build-essential zlib1g-dev liblzma-dev ruby-full g++ gcc binutils nodejs curl patch ruby-dev cmake

# https://bundler.io/v2.0/#getting-started
RUN gem install bundler
RUN gem install bundler jekyll

# folder where we going to woek
WORKDIR /usr/src/app

# Install dependencies - https://github.com/github/pages-gem
COPY ./Gemfile Gemfile
RUN bundle install

# like run bundle exec jekyll serve in bash
ENTRYPOINT ["bundle"]
CMD ["exec", "jekyll serve --livereload --host 0.0.0.0"]