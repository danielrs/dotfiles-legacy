#!/bin/bash

IMAGE=/tmp/lock-screenshot.png

maim $IMAGE
convert -scale 5% -scale 2000% $IMAGE $IMAGE
i3lock -i $IMAGE
