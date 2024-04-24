# Flutter app for Crewmeister coding challenge
## Getting started
- Project can be started by simply running it from VS Code with any flavor. Or by using a shell command `flutter run web --target lib/main_production.dart`

### Development
- In case some files with code generation have been changed we need to update generated files for those by running `dart run build_runner build --delete-conflicting-outputs`

### Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

## Deployment to GitHub pages
- `git checkout gh-pages`
- `cd frontend/ && flutter build web --target lib/main_production.dart`
- `cd ../ && cp -r frontend/build/web/* docs/`
- go to `docs/index.html` and change line `<base href="/">` to include repo name `<base href="/crewmeister-coding-challenge/">`
- `git add . && - git commit -m "Deploy Flutter web app" && git push`

## Project structure
### Frontend:
- [Very Good CLI](https://pub.dev/packages/very_good_cli) is used to create flutter project template
- app architecture is sctructured according to clean architecture and is separated into 3 layers:
  * data for interacting with external data sources. I didn't use DTO models to simplify and speed up development. `Dio` and `retrofit` are used for api calls
  * domain for internal business logic. I'm storing models here. `json_serializable` and `freezed` are used to make model generation much easier.
  * presentation for UI. Here cubits and widgets are housing

### Backend:
- I've set up two simple lambda functions for users and absences. For absences I've also added simple filtering because I thought it makes sense to do it on the server cause otherwise it messes up pagination on the client.

### Product:
- I used a really basic but robust approach for the table so it looks alright on any device starting from 320px.
- I've implemented all the extra requirements for the project. Plus I thought it would be nice to have a german translation, so I've added it too.


