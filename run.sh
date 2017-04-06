#!/bin/sh

cli="firebase"

main() {

  if [ -z "$WERCKER_FIREBASE_DEPLOY_PROJECT" ]; then
    fail "firebase-deploy: project argument cannot be empty"
  fi

  if [ -z "$WERCKER_FIREBASE_DEPLOY_TOKEN" ]; then
    fail "firebase-deploy: token argument cannot be empty"
  fi

  if [ -n "$WERCKER_FIREBASE_DEPLOY_EXCEPT" ] && [ -n "$WERCKER_FIREBASE_DEPLOY_ONLY" ]; then
    fail "firebase-deploy: cannot provide both \"except\" and \"only\" arguments"
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

  # except
  if [ -n "$WERCKER_FIREBASE_DEPLOY_EXCEPT" ]; then
    args="$args --except \"$WERCKER_FIREBASE_DEPLOY_EXCEPT\""
  fi

  # only
  if [ -n "$WERCKER_FIREBASE_DEPLOY_ONLY" ]; then
    args="$args --only \"$WERCKER_FIREBASE_DEPLOY_ONLY\""
  fi

  # only
  if [ -n "$WERCKER_FIREBASE_DEPLOY_MESSAGE" ]; then
    args="$args --message \"$WERCKER_FIREBASE_DEPLOY_MESSAGE\""
  fi

  # Check if running in debug mode
  info "Running firebase command"
  if [ "$WERCKER_FIREBASE_DEPLOY_DEBUG" = "true" ]; then
    info "$cli $cmd $args"
  fi

  eval "$cli" "$cmd" "$args"

}

main;
