#!/bin/sh

echo "copying the contents of the lib folder"
mkdir -p /app/lib
cp /project/lib/* /app/lib/

MIX="/app/mix.exs"
if test -f "$MIX"; then
    echo "no symlink needed for mix.exs"
else
    echo "symlinking the mix.exs"
    ln -s /project/mix.exs /app/mix.exs
fi

APP="/app/lib/app.ex"
if test -f "$APP"; then
    echo "no symlink needed for app.ex"
else
    echo "symlinking app.ex"
    ln -s /app/app.ex /app/lib/app.ex
fi

cd /app
mix deps.get
