# firebase-deploy

This step vendors the Firebase CLI, and allows the user to execute the
deploy command. Options are passed along to the `firebase` executable as is.

# Options:

* `project` - Firebase project name, as defined on the [Firebase console](https://console.firebase.google.com/), for example `lovely-llama`.
* `token` - Firebase authentication token generated for use in non-interactive environments (see `login:ci` command for [Firebase CLI](https://firebase.google.com/docs/cli/)).
* `message` - (Optional) Message describing the deploy.
* `only` - (Optional) Only deploy to specified, comma-separated targets (e.g. "hosting,storage").
* `except` - (Optional) Deploy to all targets except specified (e.g. "database").
* `debug` - (Optional) Prints out the command that is executed to the console. **Warning this prints everything in the clear, including the token.** Possible values are `true` or `false`. Defaults to `false`.

Note that the `only` and `except` parameters are mutually exclusive, and you should use one or the other, or neither if you want to deploy everything defined in your Firebase config.

# Example

```yml
deploy:
    steps:
      - firebase-deploy:
          project: $FIREBASE_PROJECT
          token: $FIREBASE_TOKEN
```

# License

The MIT License (MIT)

# Changelog

## 1.1.0

- Add support for optional parameters `message`, `only` and `except`

## 1.0.2

- Add checking for arguments and debug mode

## 1.0.1

- Fix typo in Firebase project name environment variable

## 1.0.0

- Initial release
