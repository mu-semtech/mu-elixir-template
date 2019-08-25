#!/bin/sh

echo "copying mix.exs file"
cp /app/project/mix.exs /app/mix.exs

echo "copying router.ex file"
cp /app/project/app.ex /app/lib/elixirtemplate/router.ex

echo "copying the contents of the lib folder"
cp -r /app/project/lib/* /app/lib/elixirtemplate

echo "getting dependencies"
cd /app
mix deps.get

echo "starting elixir"
mix run --no-halt
