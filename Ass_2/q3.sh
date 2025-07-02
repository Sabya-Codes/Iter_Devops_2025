#!/bin/bash

find / -name "conf.d" | sed 's|/|-|g' > output.txt
