#!/bin/sh

SCRIPT=$(readlink -f "$0")
STEWARD_DIR=$(dirname "$SCRIPT")/..
cd "$STEWARD_DIR"
git pull
sbt ";clean ;core/assembly"
JAR=$(find -name "*assembly*.jar" | head -n1)
export SBT_OPTS="-Xms256M -Xmx512M"
java -jar $JAR > steward.log