#!/bin/sh

cli="firebase"

main() {

  if [ -z "$WERCKER_FIREBASE_DEPLOY_PROJECT" ]; then
    fail "firebase-deploy: project argument cannot be empty"
  fi

	if [ -z "$WERCKER_FIREBASE_DEPLOY_TOKEN" ]; then
    fail "firebase-deploy: token argument cannot be empty"
  fi

	# Command
  cmd="deploy"

  # Command arguments
  args=

	# project
  if [ -n "$WERCKER_FIREBASE_DEPLOY_PROJECT" ]; then
    args="$args --project \"$WERCKER_FIREBASE_DEPLOY_PROJECT\""
  fi

	# token
  if [ -n "$WERCKER_FIREBASE_DEPLOY_TOKEN" ]; then
    args="$args --token \"$WERCKER_FIREBASE_DEPLOY_TOKEN\""
  fi

	# Check if running in debug mode
  info "Running firebase command"
  if [ "$WERCKER_FIREBASE_DEPLOY_DEBUG" = "true" ]; then
    info "$cli $cmd $args"
  fi

  eval "$cli" "$cmd" "$args"

}

main;
