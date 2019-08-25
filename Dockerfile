FROM elixir:1.9.1-alpine

LABEL maintainer="flowofcontrol@gmail.com"

COPY . /app

WORKDIR /app

RUN mix local.hex --force

RUN mix local.rebar --force

RUN mix deps.get

RUN mix run

CMD sh startup.sh