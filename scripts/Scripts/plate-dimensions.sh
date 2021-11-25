#!/usr/bin/bash

mass="$1"
height="$2"

echo "Mass: $mass"
echo "Height: $height"
echo "Outer radius: $(bc <<< "scale=4; sqrt(($mass / (2.3 * 3.1415 * $height)) - 6.25)")"
echo "Inner radius: 2.5cm"
