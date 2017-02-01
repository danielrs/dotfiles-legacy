#! /bin/bash

battery() {
  echo $(acpi --battery | cut -d, -f2) | sed 's/%//g'
}

while true; do
  echo "BAT${r}$(battery)"
  sleep 1;
done
