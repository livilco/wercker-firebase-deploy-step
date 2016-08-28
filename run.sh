#!/bin/sh

firebase deploy --project $WERCKER_FIREBASE_DEPLOY_PROJECT --token $WERCKER_FIREBASE_DEPLOY_TOKEN
