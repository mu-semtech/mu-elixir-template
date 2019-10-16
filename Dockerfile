FROM madnificent/elixir-server:1.9

LABEL maintainer="flowofcontrol@gmail.com"

ENV LOG_LEVEL info
ENV MU_SPARQL_ENDPOINT 'http://database:8890/sparql'
ENV MU_APPLICATION_GRAPH 'http://mu.semte.ch/application'

COPY ./project /project
COPY ./prepare.sh /prepare.sh

RUN sed -i '1ish prepare.sh' startup.sh
