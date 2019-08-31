FROM elixir:1.9.1-alpine

LABEL maintainer="flowofcontrol@gmail.com"

ENV APP_ENTRYPOINT web.rb
ENV LOG_LEVEL info
ENV MU_SPARQL_ENDPOINT 'http://database:8890/sparql'
ENV MU_APPLICATION_GRAPH 'http://mu.semte.ch/application'

COPY . /app
WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix run

CMD sh startup.sh