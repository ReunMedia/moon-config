#!/bin/bash

_yesNo() {
  MESSAGE=$1
  while true; do
    # Using `</dev/tty` allows us to use this inside the `while read` loop
    read -r -p "${MESSAGE} (Y/n) " yn </dev/tty
    case $yn in
        [Yy]* ) return 0;;
        [Nn]* ) return 1;;
        "" ) return ;;
        * ) echo "Please answer yes or no.";;
    esac
  done
}

_run() {
  # Make sure `.moon` directory exists
  if [ ! -d ".moon" ]; then
    echo "'.moon' directory not found. Make sure you are in the project root directory and run 'moon init' first."
    exit 1
  fi

  printf "Setting up Reun Media moon configuration\n\n"

  # Detect if package was installed with npm or Composer and set shared package
  # config directory.
  # Check if package was installed with Composer and change config directory
  if [ -e "package.json" ] && grep -q "@reunmedia/moon-config" "package.json"; then
    echo "Detected '@reunmedia/moon-config' in 'package.json'"
    PACKAGE_DIRECTORY="node_modules/@reunmedia/moon-config"
  elif [ -e "composer.json" ] && grep -q "reun/moon-config" "composer.json"; then
    echo "Detected 'reun/moon-config' in 'composer.json'"
    PACKAGE_DIRECTORY="vendor/reun/moon-config"
  else
    echo "Unable to find moon-config package in either 'package.json' or 'composer.json'"
    exit 1
  fi

  echo ""

  ROOT_DIRECTORY="$PWD"

  # Recursively loop through all shared config `.yml` files in package directory
  cd "${PACKAGE_DIRECTORY}" || exit 2
  find ".moon" -type f -name "*.yml" | while read -r FILE; do
    # echo "$FILE"

    FILE_BASENAME=$(basename "$FILE")

    # Count directory depth of the file
    DEPTH=$(tr -dc '/' <<<"$FILE" | wc -c)

    # Construct relative path to `.moon` from this file
    RELATIVE_MOON_PATH="."
    if ((DEPTH > 1)); then
      for _ in $(eval "echo {2..${DEPTH}}"); do RELATIVE_MOON_PATH+="/.."; done
    fi

    # Set relative path to schema file
    SCHEMA_DIRECTORY="${RELATIVE_MOON_PATH}/cache/schemas"
    SCHEMA_FILE=$( [[ "${FILE_BASENAME}" == "workspace.yml" ]] \
      && echo "${SCHEMA_DIRECTORY}/workspace.json" \
      || echo "${SCHEMA_DIRECTORY}/tasks.json" )

    # Set relative path to config file
    CONFIG_FILE="${RELATIVE_MOON_PATH}/../${PACKAGE_DIRECTORY}/${FILE}"

    # Construct YAML template
    TEMPLATE=$(cat <<YML
\$schema: "$SCHEMA_FILE"

extends: "$CONFIG_FILE"
YML
)

    TARGET_FILE_PATH="${ROOT_DIRECTORY}/${FILE}"

    # Confirm file overwrite
    if [ -e "${TARGET_FILE_PATH}" ]; then
      if ! _yesNo "Overwrite '${FILE}'?"; then
        continue
      fi
    fi;

    # Write template configuration to file
    echo "${TEMPLATE}" > "${TARGET_FILE_PATH}"
    echo "Wrote configuration to '${FILE}'"
  done
}

_run
